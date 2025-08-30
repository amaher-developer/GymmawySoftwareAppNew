import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/data/data_sources/remote_data/profile_remote_data_source/profile_remote_data_source.dart';
import 'package:zone/spark/data/models/profile/profile_model.dart';

import '../../../core/error/error_handler.dart';
import '../../domain/repositories/profile_repoistory.dart';
import '../models/Single_message_response.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, ProfileModel>> profileData() async {
    try {
      final result = await profileRemoteDataSource.profileData();
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }

  @override
  Future<Either<Failure, SingleMessageResponse>> deleteAccount() async {
    try {
      final result = await profileRemoteDataSource.deleteAccount();
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }
  @override
  Future<Either<Failure, SingleMessageResponse>> freezeAccount() async {
    try {
      final result = await profileRemoteDataSource.freezeAccount();
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }
}