import 'package:zone/spark/domain/entities/attendence/attendance_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/attendences_usecase/attendancest_usecase.dart';
import 'attendances_state.dart';

class AttendancesCubit extends Cubit<AttendancesState> {
  static AttendancesCubit get(BuildContext context) => BlocProvider.of(context);

  final AttendancesUseCase attendancesUseCase;
  List<AttendanceEntity?> attendances = [];

  AttendancesCubit({
    required this.attendancesUseCase,
  }) : super(AttendancesInitial());

  Future<void> getAttendances() async {
    emit(AttendancesLoadingState());
    final result = await attendancesUseCase.getAttendances();

    result.fold(
      (failure) {
        emit(AttendancesErrorState(
          message: failure.toError().message,
        ));
      },
      (attendances) async {
        this.attendances.clear();
        this.attendances = attendances;
        emit(AttendancesSuccessState(attendances: attendances));
        /* emit(AttendancesErrorState(
          message: 'failure.toError().message',
        ));*/
      },
    );
  }
// init
}
