import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/data_sources/remote_data/attendnce_remote_data_source/attendance_remote_data_source.dart';
import 'package:zone/spark/data/models/attendence/attendance.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/error/failures.dart';
import '../../domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  AttendanceRepositoryImpl({
    required this.attendanceRemoteDataSource,
  });

  final AttendanceRemoteDataSource attendanceRemoteDataSource;

  @override
  Future<Either<Failure, List<AttendanceModel?>>> getAttendances() async {
    try {
      final result = await attendanceRemoteDataSource.getAttendance();
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }
}
