// Home data source

import 'package:zone/spark/data/models/training_session/training_session_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import '../../../../../core/network/api_constants.dart';
import 'training_sessions_remote_data_source.dart';

class TrainingSessionRemoteDataSourceImpl
    implements TrainingSessionRemoteDataSource {
  TrainingSessionRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<TrainingSessionModel?>> getTrainingSessions({
    String? date,
  }) async {
    try {
      final response = await dio.post(
        ApiConstants.trainingSessions,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await UserHelper.getUserToken()}',
          },
        ),
        data: {
          "lang": UserHelper.getLanguage(),
          "date": date ?? "",
        },
      );

      if (response.data['success'] == true) {
        return TrainingSessionModel.modelFromSnapShot(
            response.data['result']["classes"]);
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      rethrow;
    }
  }
}
