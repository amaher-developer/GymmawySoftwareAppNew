import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/domain/repositories/training_sessions_repository.dart';

import '../../entities/training_session/training_session_entity.dart';

class TrainingSessionsUseCase {
  TrainingSessionsUseCase({
    required this.trainingSessionsRepository,
  });

  final TrainingSessionsRepository trainingSessionsRepository;

  Future<Either<Failure, List<TrainingSessionEntity?>>> getTrainingSessions(
      {String? date}) async {
    return await trainingSessionsRepository.getTrainingSessions(
      date: date,
    );
  }
}
