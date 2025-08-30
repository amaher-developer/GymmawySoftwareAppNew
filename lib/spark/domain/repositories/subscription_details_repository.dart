import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/models/subscription/subscription_details_model.dart';

import '../../../core/error/failures.dart';
import '../../../core/network/requests/subscription_reservation_request.dart';
import '../../data/models/Single_message_response.dart';

abstract class SubscriptionDetailsRepository {
  Future<Either<Failure, SubscriptionDetailsModel?>> getSubscriptionDetails(
      int id);

  Future<Either<Failure, SingleMessageResponse>> reserveSubscription(
      SubscriptionReservationRequest request);
}
