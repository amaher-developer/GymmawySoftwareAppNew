import 'package:zone/core/helper/user_helper.dart';
import 'package:zone/spark/data/models/Single_message_response.dart';
import 'package:zone/spark/data/models/activty/activity_details_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_constants.dart';
import '../../../models/activty/activities_model.dart';
import '../../../models/guest.dart';
import 'activites_remote_data_source.dart';

class ActivitiesRemoteDataSourceImpl implements ActivitiesRemoteDataSource {
  Dio dio;

  ActivitiesRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ActivitiesModel>> activities(String lang) async {
    try {
      final response = await dio.post(
        'activity',
        queryParameters: {'Accept': 'application/json'},
        data: {"lang": UserHelper.getLanguage()},
      );
      print('UserHelper.getLanguage() ${UserHelper.getLanguage()}');
      if (response.data['success'] == true) {
        return ActivitiesModel.modelFromSnapShot(
            response.data['result']['activities']);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<ActivityDetailsModel> activityDetails(
      String lang, int activityId) async {
    try {
      final response = await dio.post(
        'activity/$activityId',
        queryParameters: {'Accept': 'application/json'},
        data: {"lang": UserHelper.getLanguage()},
      );

      if (response.data['success'] == true) {
        return ActivityDetailsModel.modelFromSnapShot(response.data);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<SingleMessageResponse> reserveActivity(int activityId) async {
    GuestPhoneAndNameModel? guestData;
    if (UserHelper.getGuestData() != null) {
      guestData = UserHelper.getGuestData();
    }
    try {
      final response = await dio.post(
        ApiConstants.reserveActivity.replaceAll('{id}', activityId.toString()),
        queryParameters: {'Accept': 'application/json'},
        data: {
          "phone": guestData?.phone ?? UserHelper.getUserPhone(),
          "name": guestData?.name ?? UserHelper.getUserName(),
          "lang": UserHelper.getLanguage(),
        },
      );

      if (response.data['success'] == true) {
        return SingleMessageResponse.fromJson(response.data);
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      rethrow;
    }
  }
}
