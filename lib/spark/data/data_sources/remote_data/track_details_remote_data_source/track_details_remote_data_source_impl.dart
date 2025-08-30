// Home data source

import 'package:zone/spark/data/models/trak_details/trak_details.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import '../../../../../core/network/api_constants.dart';
import 'track_details_remote_data_source.dart';

class TrackDetailsRemoteDataSourceImpl implements TrackDetailsRemoteDataSource {
  TrackDetailsRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<TrackDetailsModel?> getTrackDetails({required int id}) async {
    try {
      final response = await dio.post(
        ApiConstants.trackDetails.replaceAll('{id}', id.toString()),
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
        return TrackDetailsModel.fromJson(response.data['result']["track"]);
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      rethrow;
    }
  }
}
