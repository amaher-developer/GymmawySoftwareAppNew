// Home data source

import 'package:zone/spark/data/models/attendence/attendance.dart';

abstract class AttendanceRemoteDataSource {
  Future<List<AttendanceModel?>> getAttendance();
}
