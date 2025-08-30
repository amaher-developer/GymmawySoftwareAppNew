import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/models/subscription/subscription_model.dart';

abstract class SubscriptionsRepository {
  Future<Either<Failure, List<SubscriptionModel?>>> getSubscriptions();
}
