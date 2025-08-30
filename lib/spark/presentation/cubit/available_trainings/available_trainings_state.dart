import 'package:zone/spark/domain/entities/trainings/available_trainings_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AvailableTrainingsStates extends Equatable {
  const AvailableTrainingsStates();
}

class InitialAvailableTrainingsStates extends AvailableTrainingsStates {
  @override
  List<Object?> get props => [];
}

class LoadingAvailableTrainingsStates extends AvailableTrainingsStates {
  @override
  List<Object?> get props => [];
}

class ReloadingAvailableTrainingsStates extends AvailableTrainingsStates {
  @override
  List<Object?> get props => [];
}

class SuccessAvailableTrainingsStates extends AvailableTrainingsStates {
  const SuccessAvailableTrainingsStates({required this.trainings});

  final List<AvailableTrainingEntity?> trainings;

  @override
  List<Object?> get props => [trainings];
}

class UpdateState extends AvailableTrainingsStates {
  @override
  List<Object?> get props => [];
}

class ErrorAvailableTrainingsStates extends AvailableTrainingsStates {
  final String error;

  const ErrorAvailableTrainingsStates(this.error);

  @override
  List<Object?> get props => [error];
}
