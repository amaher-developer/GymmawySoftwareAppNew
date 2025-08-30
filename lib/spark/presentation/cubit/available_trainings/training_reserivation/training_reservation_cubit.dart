import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/Single_message_response.dart';
import '../../../../domain/usecases/available_trainings_usecase/training_reservation_use_case.dart';

part 'training_reservation_state.dart';

class TrainingReservationCubit extends Cubit<TrainingReservationState> {
  TrainingReservationUseCase trainingReservationUseCase;

  TrainingReservationCubit({required this.trainingReservationUseCase})
      : super(TrainingReservationInitial());

  static TrainingReservationCubit get(context) => BlocProvider.of(context);

  Future<void> reserveTraining({required int trainingId}) async {
    emit(TrainingReservationLoadingState());
    final result = await trainingReservationUseCase(trainingId);
    result.fold(
      (failure) {
        log('reserviation falied ${failure.toError().message}');
        emit(TrainingReservationErrorState(
          message: failure.toError().message,
        ));
      },
      (reservationModel) async {
        log('reserviation success , ${reservationModel?.message}');
        emit(
          TrainingReservationSuccessState(
            reservationModel: reservationModel,
          ),
        );
      },
    );
  }
}
