import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/data/models/Single_message_response.dart';
import 'package:zone/spark/data/models/subscription/subscription_details_model.dart';

import '../../../../core/network/requests/subscription_reservation_request.dart';
import '../../repositories/subscription_details_repository.dart';

class GetSubscriptionDetailsUseCase {
  GetSubscriptionDetailsUseCase({
    required this.subscriptionsRepository,
  });

  final SubscriptionDetailsRepository subscriptionsRepository;

  Future<Either<Failure, SubscriptionDetailsModel?>> getSubscriptionDetails(
      int id) async {
    return await subscriptionsRepository.getSubscriptionDetails(id);
  }

  // reserve subscription
  Future<Either<Failure, SingleMessageResponse>> reserveSubscription(
      SubscriptionReservationRequest request) async {
    return await subscriptionsRepository.reserveSubscription(request);
  }
}
