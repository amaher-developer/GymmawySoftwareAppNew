import 'package:dartz/dartz.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/requests/login_request.dart';
import '../../../core/network/requests/splash_request.dart';
import '../../domain/entities/splash/splash_entity.dart';
import '../../domain/entities/user/user_login_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote_data/auth_remote_data_source/auth_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  UserRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserLoginEntity>> login(LoginRequest request) async {
    try {
      final result = await authRemoteDataSource.login(request);
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }

  @override
  Future<Either<Failure, SplashEntity>> getSplashData(
      SplashRequest request) async {
    try {
      final result = await authRemoteDataSource.getSplashData(request);
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }
}
