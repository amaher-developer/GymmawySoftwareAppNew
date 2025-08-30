import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/data_sources/remote_data/training_sessions_remote_data_source/training_sessions_remote_data_source.dart';
import 'package:zone/spark/data/models/training_session/training_session_model.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/error/failures.dart';
import '../../domain/repositories/training_sessions_repository.dart';

class TrainingSessionsRepositoryImpl implements TrainingSessionsRepository {
  TrainingSessionsRepositoryImpl({
    required this.trainingSessionRemoteDataSource,
  });

  final TrainingSessionRemoteDataSource trainingSessionRemoteDataSource;

  @override
  Future<Either<Failure, List<TrainingSessionModel?>>> getTrainingSessions({
    String? date,
  }) async {
    try {
      final result = await trainingSessionRemoteDataSource.getTrainingSessions(
        date: date,
      );
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }
}
