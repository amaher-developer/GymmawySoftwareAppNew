import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/models/subscription/subscription_model.dart';
import 'package:zone/spark/domain/repositories/subscriptions_repository.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/error/failures.dart';
import '../data_sources/remote_data/subscription_remote_data_source/subscription_remote_data_source.dart';

class SubscriptionsRepositoryImpl implements SubscriptionsRepository {
  SubscriptionsRepositoryImpl({
    required this.subscriptionsRemoteDataSource,
  });

  final SubscriptionsRemoteDataSource subscriptionsRemoteDataSource;

  @override
  Future<Either<Failure, List<SubscriptionModel?>>> getSubscriptions() async {
    try {
      final result = await subscriptionsRemoteDataSource.getSubscriptionData();
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }
}
