// Home data source

import 'package:zone/spark/data/models/traks/traks.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import '../../../../../core/network/api_constants.dart';
import 'traks_remote_data_source.dart';

class TracksRemoteDataSourceImpl implements TracksRemoteDataSource {
  TracksRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<TrackModel?>> getTracks() async {
    try {
      final response = await dio.post(
        ApiConstants.tracks,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await UserHelper.getUserToken()}',
          },
        ),
        data: {
          "lang": UserHelper.getLanguage(),
        },
      );

      if (response.data['success'] == true) {
        return TrackModel.modelFromSnapShot(response.data['result']["tracks"]);
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      rethrow;
    }
  }
}
