import '../../../models/trainings/trainig_plan_model.dart';
import '../../../models/trainings/training_plans_model.dart';

abstract class TrainingPlanRemoteDataSource {
  Future<PlanModel> trainingPlan(String lang, int trainingPlanId);

  Future<PlansModel> trainingPlans(String lang, int type);
}
