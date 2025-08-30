import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/models/attendence/attendance.dart';

abstract class AttendanceRepository {
  Future<Either<Failure, List<AttendanceModel?>>> getAttendances();
}
