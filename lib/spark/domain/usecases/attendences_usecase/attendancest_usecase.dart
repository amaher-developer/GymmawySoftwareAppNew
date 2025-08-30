import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/domain/entities/attendence/attendance_entity.dart';
import 'package:zone/spark/domain/repositories/attendance_repository.dart';

class AttendancesUseCase {
  AttendancesUseCase({
    required this.attendanceRepository,
  });

  final AttendanceRepository attendanceRepository;

  Future<Either<Failure, List<AttendanceEntity?>>> getAttendances() async {
    return await attendanceRepository.getAttendances();
  }
}
