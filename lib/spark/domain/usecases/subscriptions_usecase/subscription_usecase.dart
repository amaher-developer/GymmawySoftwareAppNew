import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';

import '../../../data/models/subscription/subscription_model.dart';
import '../../repositories/subscriptions_repository.dart';

class GetSubscriptionsUseCase {
  GetSubscriptionsUseCase({
    required this.subscriptionsRepository,
  });

  final SubscriptionsRepository subscriptionsRepository;

  Future<Either<Failure, List<SubscriptionModel?>>> getSubscriptions() async {
    return await subscriptionsRepository.getSubscriptions();
  }
}
