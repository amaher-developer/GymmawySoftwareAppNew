import 'package:dartz/dartz.dart';
import 'package:zone/spark/domain/entities/splash/splash_entity.dart';

import '../../../core/error/failures.dart';
import '../../../core/network/requests/login_request.dart';
import '../../../core/network/requests/splash_request.dart';
import '../entities/user/user_login_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserLoginEntity>> login(LoginRequest request);
  Future<Either<Failure, SplashEntity>> getSplashData(SplashRequest request);
}
