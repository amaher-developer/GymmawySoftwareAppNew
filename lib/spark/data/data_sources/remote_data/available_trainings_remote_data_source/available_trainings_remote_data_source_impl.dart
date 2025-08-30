// Home data source

import 'package:zone/spark/data/models/trainings/available_trainings.dart';
import 'package:zone/spark/data/models/trainings/training_details_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import '../../../../../core/network/api_constants.dart';
import '../../../models/Single_message_response.dart';
import '../../../models/guest.dart';
import 'available_trainings_remote_data_source.dart';

class AvailableTrainingsRemoteDataSourceImpl
    implements AvailableTrainingsRemoteDataSource {
  AvailableTrainingsRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<AvailableTrainingModel?>> getAvailableTrainingsData() async {
    try {
      final response = await dio.post(
        ApiConstants.getTrainings,
        data: {
          "lang": UserHelper.getLanguage(),
        },
      );
      if (response.data['message'] == 'OK') {
        return AvailableTrainingModel.modelFromSnapShot(
            response.data['result']['trainings']);
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      print(' *********  exception is ********** : $exception');
      rethrow;
    }
  }

  @override
  Future<TrainingModel> trainingDetails(String lang, int trainingId) async {
    try {
      final response = await dio.post(
        'pt-training/$trainingId',
        queryParameters: {'Accept': 'application/json'},
        data: {"lang": UserHelper.getLanguage()},
      );

      if (response.data['success'] == true) {
        return TrainingModel.modelFromSnapShot(response.data);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }

  // reserveTraining
  @override
  Future<SingleMessageResponse?> reserveTraining(
      {required int trainingId}) async {
    GuestPhoneAndNameModel? guestData;
    if (UserHelper.getGuestData() != null) {
      guestData = UserHelper.getGuestData();
    }

    try {
      final response = await dio.post(
        ApiConstants.trainingReservation.replaceFirst('{id}', '$trainingId'),
        options: Options(headers: {
          'Authorization': 'Bearer ${UserHelper.getUserToken()}',
        }),
        data: {
          "phone": guestData?.phone ?? UserHelper.getUserPhone(),
          "name": guestData?.name ?? UserHelper.getUserName(),
          "lang": UserHelper.getLanguage(),
        },
      );
      if (response.data['success'] == true) {
        return SingleMessageResponse.fromJson(response.data);
      } else {
        throw CustomException.unKnownException(response.data.toString());
      }
    } catch (exception) {
      rethrow;
    }
  }
}
