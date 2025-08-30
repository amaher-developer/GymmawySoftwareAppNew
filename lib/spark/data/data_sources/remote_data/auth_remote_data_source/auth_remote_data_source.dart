import 'package:zone/core/network/requests/splash_request.dart';
import 'package:zone/spark/data/models/splash/splash_model.dart';

import '../../../../../core/network/requests/login_request.dart';
import '../../../models/user/user_login_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserLoginModel> login(LoginRequest request);
  Future<SplashModel> getSplashData(SplashRequest request);
}
