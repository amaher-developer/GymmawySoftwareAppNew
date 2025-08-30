import 'package:dartz/dartz.dart';
import 'package:zone/spark/domain/entities/activity/activity_details_enrtity.dart';
import 'package:zone/spark/domain/entities/activity/activties_entity.dart';

import '../../../core/error/failures.dart';
import '../../data/models/Single_message_response.dart';

abstract class ActivitiesRepository {
  Future<Either<Failure, List<ActivitiesEntity>>> activities(String lang);

  Future<Either<Failure, ActivityDetailsEntity>> activityDetails(
      String lang, int activityId);
  Future<Either<Failure, SingleMessageResponse>> reserveActivity(
      int activityId);
}
