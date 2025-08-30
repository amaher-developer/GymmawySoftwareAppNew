import 'package:zone/spark/domain/entities/training_session/training_session_entity.dart';
import 'package:equatable/equatable.dart';

abstract class TrainingSessionsState extends Equatable {
  const TrainingSessionsState();
}

class TrainingSessionsInitial extends TrainingSessionsState {
  @override
  List<Object> get props => [];
}

class TrainingSessionsLoadingState extends TrainingSessionsState {
  @override
  List<Object?> get props => [];
}

class TrainingSessionsErrorState extends TrainingSessionsState {
  final String message;

  const TrainingSessionsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class TrainingSessionsSuccessState extends TrainingSessionsState {
  final List<TrainingSessionEntity?> trainingSessions;

  const TrainingSessionsSuccessState({
    required this.trainingSessions,
  });

  @override
  List<Object?> get props => [trainingSessions];
}
