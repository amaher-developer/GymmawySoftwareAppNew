import 'package:zone/spark/data/models/subscription/subscription_model.dart';
import 'package:equatable/equatable.dart';

abstract class SubscriptionsStates extends Equatable {
  const SubscriptionsStates();
}

class InitialSubscriptionsStates extends SubscriptionsStates {
  @override
  List<Object?> get props => [];
}

class LoadingSubscriptionsStates extends SubscriptionsStates {
  @override
  List<Object?> get props => [];
}

class ReloadingSubscriptionsStates extends SubscriptionsStates {
  @override
  List<Object?> get props => [];
}

class SuccessSubscriptionsStates extends SubscriptionsStates {
  const SuccessSubscriptionsStates({required this.subscriptions});

  final List<SubscriptionModel?> subscriptions;

  @override
  List<Object?> get props => [subscriptions];
}

class UpdateState extends SubscriptionsStates {
  @override
  List<Object?> get props => [];
}

class ErrorSubscriptionsStates extends SubscriptionsStates {
  final String error;

  const ErrorSubscriptionsStates(this.error);

  @override
  List<Object?> get props => [error];
}
