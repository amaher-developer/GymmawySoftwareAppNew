import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../data/models/trainings/training_plans_model.dart';
import '../../repositories/training_plan_repository.dart';


class GetTrainingPlansUseCase {
  GetTrainingPlansUseCase({
    required this.trainingPlanRepository,
  });

  final TrainingPlanRepository trainingPlanRepository;

  Future<Either<Failure, PlansModel>> call(String lang, int type) async {
    return await trainingPlanRepository.trainingPlans(lang, type);
  }
}