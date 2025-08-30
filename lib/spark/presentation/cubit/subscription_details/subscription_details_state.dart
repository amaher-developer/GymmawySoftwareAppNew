import 'package:zone/spark/data/models/Single_message_response.dart';
import 'package:zone/spark/data/models/subscription/subscription_details_model.dart';
import 'package:equatable/equatable.dart';

abstract class SubscriptionDetailsStates extends Equatable {
  const SubscriptionDetailsStates();
}

class InitialSubscriptionDetailsStates extends SubscriptionDetailsStates {
  @override
  List<Object?> get props => [];
}

class LoadingSubscriptionDetailsStates extends SubscriptionDetailsStates {
  @override
  List<Object?> get props => [];
}

class ReloadingSubscriptionDetailsStates extends SubscriptionDetailsStates {
  @override
  List<Object?> get props => [];
}

class SuccessSubscriptionDetailsStates extends SubscriptionDetailsStates {
  const SuccessSubscriptionDetailsStates({required this.subscriptionDetails});

  final SubscriptionDetailsModel? subscriptionDetails;

  @override
  List<Object?> get props => [subscriptionDetails];
}

// reserve subscription
class SuccessSubscriptionReservingStates extends SubscriptionDetailsStates {
  const SuccessSubscriptionReservingStates(
      {required this.reservedSubscription});

  final SingleMessageResponse? reservedSubscription;

  @override
  List<Object?> get props => [reservedSubscription];
}

class ErrorSubscriptionDetailsStates extends SubscriptionDetailsStates {
  final String error;

  const ErrorSubscriptionDetailsStates(this.error);

  @override
  List<Object?> get props => [error];
}
