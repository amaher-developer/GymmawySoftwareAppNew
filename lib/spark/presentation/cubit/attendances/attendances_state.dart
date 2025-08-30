import 'package:zone/spark/domain/entities/attendence/attendance_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AttendancesState extends Equatable {
  const AttendancesState();
}

class AttendancesInitial extends AttendancesState {
  @override
  List<Object> get props => [];
}

class AttendancesLoadingState extends AttendancesState {
  @override
  List<Object?> get props => [];
}

class AttendancesErrorState extends AttendancesState {
  final String message;

  const AttendancesErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class AttendancesSuccessState extends AttendancesState {
  final List<AttendanceEntity?> attendances;

  const AttendancesSuccessState({
    required this.attendances,
  });

  @override
  List<Object?> get props => [attendances];
}
