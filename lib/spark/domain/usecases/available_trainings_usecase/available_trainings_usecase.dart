import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/domain/repositories/available_trainings_repoistory.dart';

import '../../../data/models/trainings/available_trainings.dart';

class AvailableTrainingsUseCase {
  AvailableTrainingsUseCase({
    required this.availableTrainingsRepository,
  });

  final AvailableTrainingsRepository availableTrainingsRepository;

  Future<Either<Failure, List<AvailableTrainingModel?>>>
      getAvailableTrainings() async {
    return await availableTrainingsRepository.getAvailableTrainings();
  }
}
