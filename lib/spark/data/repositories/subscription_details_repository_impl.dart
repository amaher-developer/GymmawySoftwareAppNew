import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/models/Single_message_response.dart';
import 'package:zone/spark/data/models/subscription/subscription_details_model.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/requests/subscription_reservation_request.dart';
import '../../domain/repositories/subscription_details_repository.dart';
import '../data_sources/remote_data/subscription_details_remote_data_source/subscription_details_remote_data_source.dart';

class SubscriptionDetailsRepositoryImpl
    implements SubscriptionDetailsRepository {
  SubscriptionDetailsRepositoryImpl({
    required this.subscriptionsRemoteDataSource,
  });

  final SubscriptionDetailsRemoteDataSource subscriptionsRemoteDataSource;

  @override
  Future<Either<Failure, SubscriptionDetailsModel?>> getSubscriptionDetails(
      int id) async {
    try {
      final result =
          await subscriptionsRemoteDataSource.getSubscriptionDetails(id);
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, SingleMessageResponse>> reserveSubscription(
      SubscriptionReservationRequest request) async {
    try {
      final result =
          await subscriptionsRemoteDataSource.reserveSubscription(request);
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }
}
