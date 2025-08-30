import 'package:dartz/dartz.dart';
import 'package:zone/spark/domain/entities/trainings/training_details_entity.dart';

import '../../../../core/error/failures.dart';
import '../../repositories/available_trainings_repoistory.dart';

class GetTrainingDetailsUseCase {
  final AvailableTrainingsRepository availableTrainingsRepository;

  GetTrainingDetailsUseCase({required this.availableTrainingsRepository});

  Future<Either<Failure, TrainingEntity>> call(
      String lang, int trainingId) async {
    return await availableTrainingsRepository.trainingDetails(lang, trainingId);
  }
}
