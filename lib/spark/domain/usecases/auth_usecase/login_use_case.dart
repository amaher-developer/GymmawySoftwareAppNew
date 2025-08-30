import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/use_cases/base_use_case.dart';
import '../../../../core/network/requests/login_request.dart';
import '../../entities/user/user_login_entity.dart';
import '../../repositories/user_repository.dart';

class LoginUseCase extends BaseUseCase<LoginRequest, UserLoginEntity> {
  final UserRepository userRepository;

  LoginUseCase({required this.userRepository});

  @override
  Future<Either<Failure, UserLoginEntity>> call(LoginRequest input) async {
    return await userRepository.login(input);
  }
}
