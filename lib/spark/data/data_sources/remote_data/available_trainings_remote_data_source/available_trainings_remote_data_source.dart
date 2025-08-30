// Home data source
import 'package:zone/spark/data/models/trainings/available_trainings.dart';
import 'package:zone/spark/data/models/trainings/training_details_model.dart';

import '../../../models/Single_message_response.dart';

abstract class AvailableTrainingsRemoteDataSource {
  Future<List<AvailableTrainingModel?>> getAvailableTrainingsData();

  Future<TrainingModel> trainingDetails(String lang, int trainingId);

  // reserveTraining
  Future<SingleMessageResponse?> reserveTraining({required int trainingId});
}
