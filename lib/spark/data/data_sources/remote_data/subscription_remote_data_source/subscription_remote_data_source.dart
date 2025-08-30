// Home data source
import 'package:zone/spark/data/models/subscription/subscription_model.dart';

abstract class SubscriptionsRemoteDataSource {
  Future<List<SubscriptionModel?>> getSubscriptionData();
}
