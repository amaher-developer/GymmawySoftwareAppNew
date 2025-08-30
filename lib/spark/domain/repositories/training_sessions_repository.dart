import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/models/training_session/training_session_model.dart';

abstract class TrainingSessionsRepository {
  Future<Either<Failure, List<TrainingSessionModel?>>> getTrainingSessions({
    String? date,
  });
}
