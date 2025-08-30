import 'package:dartz/dartz.dart';
import 'package:zone/core/error/error_handler.dart';

import '../../../core/error/failures.dart';
import '../../domain/entities/home/home_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/remote_data/home_remote_data_source/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<Either<Failure, HomeEntity>> getHomeData() async {
    try {
      final result = await homeDataSource.getHomeData();
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }
}
