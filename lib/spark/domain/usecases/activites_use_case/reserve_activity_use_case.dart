import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/models/Single_message_response.dart';

import '../../../../core/error/failures.dart';
import '../../repositories/activity_repoistory.dart';

class ReserveActivityUseCase {
  final ActivitiesRepository _activityRepository;

  ReserveActivityUseCase(this._activityRepository);

  Future<Either<Failure, SingleMessageResponse>> call(
      {required int activityId}) async {
    return await _activityRepository.reserveActivity(activityId);
  }
}
