part of 'activity_details_cubit.dart';

abstract class ActivityDetailsState extends Equatable {
  const ActivityDetailsState();
}

class ActivityDetailsInitial extends ActivityDetailsState {
  @override
  List<Object> get props => [];
}

class ActivityDetailsLoadingState extends ActivityDetailsState {
  @override
  List<Object?> get props => [];
}

class ActivityDetailsErrorState extends ActivityDetailsState {
  final String message;

  const ActivityDetailsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ActivityDetailsSuccessState extends ActivityDetailsState {
  final ActivityDetailsEntity activityDetails;

  const ActivityDetailsSuccessState({
    required this.activityDetails,
  });

  @override
  List<Object?> get props => [activityDetails];
}

class SuccessReserveActivityState extends ActivityDetailsState {
  final SingleMessageResponse reservation;

  const SuccessReserveActivityState({
    required this.reservation,
  });

  @override
  List<Object?> get props => [reservation];
}

class ErrorReserveActivityState extends ActivityDetailsState {
  final String message;

  const ErrorReserveActivityState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
