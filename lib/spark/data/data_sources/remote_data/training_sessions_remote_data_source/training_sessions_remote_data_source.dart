// Home data source

import 'package:zone/spark/data/models/training_session/training_session_model.dart';

abstract class TrainingSessionRemoteDataSource {
  Future<List<TrainingSessionModel?>> getTrainingSessions({
    String? date,
  });
}
