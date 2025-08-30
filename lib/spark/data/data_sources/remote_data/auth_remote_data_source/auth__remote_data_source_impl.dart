import 'dart:io';

import 'package:zone/core/network/requests/login_request.dart';
import 'package:zone/core/network/requests/splash_request.dart';
import 'package:zone/spark/data/models/splash/splash_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import '../../../models/user/user_login_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserLoginModel> login(LoginRequest request) async {
    try {
      final response = await dio.post(
        'member_login',
        queryParameters: {'Accept': 'application/json'},
        data: {
          "phone": request.phone,
          "code": request.code,
          "device_token": request.deviceToken,
          "device_type": Platform.isAndroid ? 'android' : 'ios',
        },
      );

      if (response.data['success'] == true) {
        return UserLoginModel.modelFromSnapShot(response.data);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<SplashModel> getSplashData(SplashRequest request) async {
    try {
      final response = await dio.post(
        'splash',
        queryParameters: {'Accept': 'application/json'},
        options: Options(
          headers: {
            if (UserHelper.getUserToken() != null)
              'Authorization': 'Bearer ${UserHelper.getUserToken()}',
          },
        ),
        data: {
          "lang": UserHelper.getLanguage(),
          "device_token": request.deviceToken,
          "device_type": request.deviceType
        },
      );

      if (response.data['success'] == true) {
        return SplashModel.modelFromSnapShot(response.data);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }
}
