part of 'activities_cubit.dart';

abstract class ActivitiesState extends Equatable {
  const ActivitiesState();
}

class ActivitiesInitial extends ActivitiesState {
  @override
  List<Object> get props => [];
}

class ActivitiesLoadingState extends ActivitiesState {
  @override
  List<Object?> get props => [];
}

class ActivitiesErrorState extends ActivitiesState {
  final String message;

  const ActivitiesErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ActivitiesSuccessState extends ActivitiesState {
  final List<ActivitiesEntity> activities;

  const ActivitiesSuccessState({
    required this.activities,
  });

  @override
  List<Object?> get props => [activities];
}
