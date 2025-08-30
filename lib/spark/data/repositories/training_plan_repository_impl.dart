import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/data_sources/remote_data/training_plan_remote_data_source/training_plan_remote_data_source.dart';
import 'package:zone/spark/data/models/activty/activity_details_model.dart';
import 'package:zone/spark/data/models/trainings/trainig_plan_model.dart';
import 'package:zone/spark/data/models/trainings/training_plans_model.dart';
import 'package:zone/spark/domain/entities/activity/activity_details_enrtity.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/error/failures.dart';
import '../../domain/repositories/store_repository.dart';
import '../../domain/repositories/training_plan_repository.dart';
import '../data_sources/remote_data/store_remote_data_source/store_remote_data_source.dart';
import '../models/store/store_model.dart';

class TrainingPlanRepositoryImpl implements TrainingPlanRepository {
  TrainingPlanRepositoryImpl({
    required this.trainingPlanRemoteDataSource,
  });

  final TrainingPlanRemoteDataSource trainingPlanRemoteDataSource;
  @override
  Future<Either<Failure, PlanModel>> trainingPlan(
      String lang, int trainingPlanId) async {
    try {
      final result =
          await trainingPlanRemoteDataSource.trainingPlan(lang, trainingPlanId);
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, PlansModel>> trainingPlans(
      String lang, int type) async {
    try {
      final result =
          await trainingPlanRemoteDataSource.trainingPlans(lang, type);
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }
}
