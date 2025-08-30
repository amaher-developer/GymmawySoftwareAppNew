import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/models/trainings/available_trainings.dart';
import 'package:zone/spark/domain/entities/trainings/training_details_entity.dart';

import '../../../core/error/failures.dart';
import '../../data/models/Single_message_response.dart';

abstract class AvailableTrainingsRepository {
  Future<Either<Failure, List<AvailableTrainingModel?>>>
      getAvailableTrainings();

  Future<Either<Failure, TrainingEntity>> trainingDetails(
      String lang, int trainingId);

  // reserveTraining
  Future<Either<Failure, SingleMessageResponse?>> reserveTraining(
      {required int trainingId});
}
