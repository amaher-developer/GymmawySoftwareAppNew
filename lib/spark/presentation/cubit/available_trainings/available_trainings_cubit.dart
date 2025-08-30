import 'package:zone/spark/domain/entities/trainings/available_trainings_entity.dart';
import 'package:zone/spark/domain/usecases/available_trainings_usecase/available_trainings_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'available_trainings_state.dart';

class AvailableTrainingsCubit extends Cubit<AvailableTrainingsStates> {
  final AvailableTrainingsUseCase availableTrainingsUseCase;
  List<AvailableTrainingEntity?> availableTrainings = [];

  AvailableTrainingsCubit({required this.availableTrainingsUseCase})
      : super(InitialAvailableTrainingsStates());

  static AvailableTrainingsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getAvailableTrainings() async {
    emit(LoadingAvailableTrainingsStates());
    final result = await availableTrainingsUseCase.getAvailableTrainings();
    result.fold(
      (failure) =>
          emit(ErrorAvailableTrainingsStates(failure.toError().message)),
      (trainings) {
        availableTrainings = trainings;
        emit(SuccessAvailableTrainingsStates(trainings: trainings));
      },
    );
  }

  updateState() {
    emit(UpdateState());
  }
}
