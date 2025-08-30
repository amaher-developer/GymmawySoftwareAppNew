part of 'training_reservation_cubit.dart';

abstract class TrainingReservationState extends Equatable {
  const TrainingReservationState();
}

class TrainingReservationInitial extends TrainingReservationState {
  @override
  List<Object> get props => [];
}

class TrainingReservationLoadingState extends TrainingReservationState {
  @override
  List<Object?> get props => [];
}

class TrainingReservationErrorState extends TrainingReservationState {
  final String message;

  const TrainingReservationErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class TrainingReservationSuccessState extends TrainingReservationState {
  final SingleMessageResponse? reservationModel;

  const TrainingReservationSuccessState({
    required this.reservationModel,
  });

  @override
  List<Object?> get props => [reservationModel];
}
