import 'package:zone/core/helper/user_helper.dart';
import 'package:zone/core/network/api_constants.dart';
import 'package:zone/spark/data/models/profile/profile_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../models/Single_message_response.dart';
import 'profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  Dio dio;

  ProfileRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProfileModel> profileData() async {
    try {
      final response = await dio.post(
        ApiConstants.getProfile,
        queryParameters: {'Accept': 'application/json'},
        options: Options(
          headers: {
            "lang": UserHelper.getLanguage(),
            'Authorization': 'Bearer ${UserHelper.getUserToken()}',
          },
        ),
        data: {
          "lang": UserHelper.getLanguage(),
        },
      );

      if (response.data['success'] == true) {
        return ProfileModel.fromJson(response.data['result']);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<SingleMessageResponse> deleteAccount() async {
    try {
      final response = await dio.post(
        ApiConstants.deleteAccount,
        queryParameters: {'Accept': 'application/json'},
        options: Options(
          headers: {
            if (UserHelper.getUserToken() != null)
              'Authorization': 'Bearer ${UserHelper.getUserToken()}',
          },
        ),
        data: {
          "lang": UserHelper.getLanguage(),
        },
      );
      print(response.data['status']);
      if (response.data['status'] == 200) {
        return SingleMessageResponse.fromJson(response.data);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }

  Future<SingleMessageResponse> freezeAccount() async {
    try {
      final response = await dio.post(
        ApiConstants.freezeAccount,
        queryParameters: {'Accept': 'application/json'},
        options: Options(
          headers: {
            if (UserHelper.getUserToken() != null)
              'Authorization': 'Bearer ${UserHelper.getUserToken()}',
          },
        ),
        data: {
          "lang": UserHelper.getLanguage(),
        },
      );
      print(response.data['status']);
      if (response.data['status'] == 200) {
        return SingleMessageResponse.fromJson(response.data);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }
  //
}
