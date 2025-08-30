import 'package:dartz/dartz.dart';
import 'package:zone/core/network/requests/splash_request.dart';
import 'package:zone/spark/domain/entities/splash/splash_entity.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/use_cases/base_use_case.dart';
import '../../repositories/user_repository.dart';

class SplashUseCase extends BaseUseCase<SplashRequest, SplashEntity> {
  final UserRepository userRepository;

  SplashUseCase({required this.userRepository});

  @override
  Future<Either<Failure, SplashEntity>> call(SplashRequest input) async {
    return await userRepository.getSplashData(input);
  }
}
