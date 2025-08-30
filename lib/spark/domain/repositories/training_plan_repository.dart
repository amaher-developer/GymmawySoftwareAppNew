import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/models/trainings/trainig_plan_model.dart';
import '../../data/models/trainings/training_plans_model.dart';

abstract class TrainingPlanRepository {
  Future<Either<Failure, PlanModel>> trainingPlan(
      String lang, int trainingPlanId);

  Future<Either<Failure, PlansModel>> trainingPlans(String lang, int type);
}
