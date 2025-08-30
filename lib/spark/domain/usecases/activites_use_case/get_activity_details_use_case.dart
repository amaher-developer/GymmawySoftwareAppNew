import 'package:dartz/dartz.dart';
import 'package:zone/spark/domain/entities/activity/activity_details_enrtity.dart';

import '../../../../core/error/failures.dart';
import '../../repositories/activity_repoistory.dart';

class GetActivityDetailsUseCase {
  final ActivitiesRepository activitiesRepository;

  GetActivityDetailsUseCase({required this.activitiesRepository});

  Future<Either<Failure, ActivityDetailsEntity>> call(
      String lang, int activityId) async {
    return await activitiesRepository.activityDetails(lang, activityId);
  }
}
