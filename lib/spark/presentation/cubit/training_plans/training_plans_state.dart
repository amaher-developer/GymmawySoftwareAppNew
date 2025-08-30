part of 'training_plans_cubit.dart';

abstract class TrainingPlansState extends Equatable {
  const TrainingPlansState();
}

class TrainingPlansInitial extends TrainingPlansState {
  @override
  List<Object> get props => [];
}
class TrainingPlansLoadingState extends TrainingPlansState {
  @override
  List<Object?> get props => [];
}

class TrainingPlansErrorState extends TrainingPlansState {
  final String message;

  const TrainingPlansErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class TrainingPlansSuccessState extends TrainingPlansState {
  final PlansEntity plansEntity;
  const TrainingPlansSuccessState({
    required this.plansEntity,
  });

  @override
  List<Object?> get props => [plansEntity];
}