// Home data source

import 'package:zone/spark/data/models/attendence/attendance.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import '../../../../../core/network/api_constants.dart';
import 'attendance_remote_data_source.dart';

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  AttendanceRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<AttendanceModel?>> getAttendance() async {
    try {
      final response = await dio.post(
        ApiConstants.attendances,
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
        return AttendanceModel.modelFromSnapShot(
            response.data['result']["attendances"]);
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      print(' *********  exception is ********** : $exception');
      rethrow;
    }
  }
}
