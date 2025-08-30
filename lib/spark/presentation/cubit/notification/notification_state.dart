import 'package:equatable/equatable.dart';

abstract class NotificationStates extends Equatable {
  const NotificationStates();
}

class InitialNotificationState extends NotificationStates {
  @override
  List<Object?> get props => [];
}

class LoadingNotificationState extends NotificationStates {
  @override
  List<Object?> get props => [];
}

class ReloadingNotificationState extends NotificationStates {
  @override
  List<Object?> get props => [];
}

class SuccessNotificationState extends NotificationStates {
  const SuccessNotificationState();

  @override
  List<Object?> get props => [];
}

class UpdateState extends NotificationStates {
  @override
  List<Object?> get props => [];
}

class ErrorNotificationState extends NotificationStates {
  final String error;

  const ErrorNotificationState(this.error);

  @override
  List<Object?> get props => [error];
}
