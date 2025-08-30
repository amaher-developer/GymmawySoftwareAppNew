part of 'training_plan_cubit.dart';

abstract class TrainingPlanState extends Equatable {
  const TrainingPlanState();
}

class TrainingPlanInitial extends TrainingPlanState {
  @override
  List<Object> get props => [];
}
class TrainingPlanLoadingState extends TrainingPlanState {
  @override
  List<Object?> get props => [];
}

class TrainingPlanErrorState extends TrainingPlanState {
  final String message;

  const TrainingPlanErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class TrainingPlanSuccessState extends TrainingPlanState {
  final PlanEntity planEntity;
  const TrainingPlanSuccessState({
    required this.planEntity,
  });

  @override
  List<Object?> get props => [planEntity];
}