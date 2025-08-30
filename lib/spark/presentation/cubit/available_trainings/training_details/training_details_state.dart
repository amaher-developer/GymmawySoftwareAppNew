part of 'training_details_cubit.dart';

abstract class TrainingDetailsState extends Equatable {
  const TrainingDetailsState();
}

class TrainingDetailsInitial extends TrainingDetailsState {
  @override
  List<Object> get props => [];
}

class TrainingDetailsLoadingState extends TrainingDetailsState {
  @override
  List<Object?> get props => [];
}

class TrainingDetailsErrorState extends TrainingDetailsState {
  final String message;

  const TrainingDetailsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class TrainingDetailsSuccessState extends TrainingDetailsState {
  final TrainingEntity trainingDetails;

  const TrainingDetailsSuccessState({
    required this.trainingDetails,
  });

  @override
  List<Object?> get props => [trainingDetails];
}
