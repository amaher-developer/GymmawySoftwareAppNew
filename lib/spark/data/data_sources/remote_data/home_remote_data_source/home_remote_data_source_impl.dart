// Home data source
import 'dart:io';

import 'package:zone/core/error/exceptions.dart';
import 'package:zone/core/network/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../../core/helper/user_helper.dart';
import '../../../models/home.dart';
import 'home_remote_data_source.dart';

/*void main() async {
  HomeRemoteDataSourceImpl homeRemoteDataSourceImpl =
      HomeRemoteDataSourceImpl(dio: init());
  print('*********  HomeData **********');
  await homeRemoteDataSourceImpl.getHomeData();
}*/

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl({
    required this.dio,
  });
  final Dio dio;
  // Get home data
  @override
  Future<HomeModel> getHomeData() async {
    String? deviceToken;
    await FirebaseMessaging.instance.getToken().then((value) {
      deviceToken = value;
    });
    try {
      final response = await dio.post(
        ApiConstants.home,
        options: Options(
          headers: {
            if (UserHelper.getUserToken() != null)
              'Authorization': 'Bearer ${UserHelper.getUserToken()}',
          },
        ),
        data: {
          "lang": UserHelper.getLanguage(),
          'device_token': deviceToken ?? '',
          'device_type': Platform.isAndroid ? 'android' : 'ios',
        },
      );

      print('*********  response is ********** : ${response.data}');

      if (response.data['message'] == 'OK') {
        return HomeModel.fromJson(response.data['result']);
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      print(' *********  exception is ********** : $exception');
      rethrow;
    }
  }
}
/*

Dio init({
  String baseUrl = ApiConstants.baseUrl,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 100),
      receiveTimeout: const Duration(seconds: 100),
      receiveDataWhenStatusError: true,
      validateStatus: (status) {
        return true;
      },
    ),
  );

  return dio;
}
*/
