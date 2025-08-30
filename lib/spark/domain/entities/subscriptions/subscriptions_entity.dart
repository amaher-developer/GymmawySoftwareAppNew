import 'package:equatable/equatable.dart';

import '../../../data/models/subscription/subscription_model.dart';

class SubscriptionEntity extends Equatable {
  final List<SubscriptionModel> subscriptions;

  const SubscriptionEntity({
    this.subscriptions = const [],
  });

  @override
  List<Object?> get props => [
        subscriptions,
      ];
}
