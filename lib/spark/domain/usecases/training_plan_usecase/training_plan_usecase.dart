import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/domain/repositories/training_plan_repository.dart';

import '../../../data/models/trainings/trainig_plan_model.dart';

class GetTrainingPlanUseCase {
  GetTrainingPlanUseCase({
    required this.trainingPlanRepository,
  });

  final TrainingPlanRepository trainingPlanRepository;

  Future<Either<Failure, PlanModel>> call(
      String lang, int trainingPlanId) async {
    return await trainingPlanRepository.trainingPlan(lang, trainingPlanId);
  }
}
