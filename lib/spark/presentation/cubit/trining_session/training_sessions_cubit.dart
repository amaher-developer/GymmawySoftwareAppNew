import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:zone/core/extensions/date_helper_extensions.dart';
import 'package:zone/spark/domain/usecases/training_sessions_usecase/training_sessions_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/training_session/training_session_entity.dart';
import 'training_sessions_state.dart';

class TrainingSessionsCubit extends Cubit<TrainingSessionsState> {
  static TrainingSessionsCubit get(BuildContext context) =>
      BlocProvider.of(context);
  final DatePickerController datePickerController = DatePickerController();
  DateTime selectedValue = DateTime.now();
  DateTime initialDate = DateTime.now().subtract(const Duration(days: 30 * 4));
  DateTime currentDate = DateTime.now();
  final TrainingSessionsUseCase trainingSessionsUseCase;
  List<TrainingSessionEntity?> trainingSessions = [];

  TrainingSessionsCubit({
    required this.trainingSessionsUseCase,
  }) : super(TrainingSessionsInitial());

  Future<void> getTrainingSessions({String? date}) async {
    emit(TrainingSessionsLoadingState());
    final result = await trainingSessionsUseCase.getTrainingSessions(
      date: date ?? selectedValue.dateOnlyText,
    );

    result.fold(
      (failure) {
        emit(TrainingSessionsErrorState(
          message: failure.toError().message,
        ));
      },
      (trainingSessions) async {
        this.trainingSessions.clear();
        this.trainingSessions = trainingSessions;
        emit(TrainingSessionsSuccessState(trainingSessions: trainingSessions));
        /* emit(TrainingSessionsErrorState(
          message: 'failure.toError().message',
        ));*/
      },
    );
  }
// init
}
