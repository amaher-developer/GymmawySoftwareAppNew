import 'package:zone/spark/domain/entities/activity/activties_entity.dart';
import 'package:equatable/equatable.dart';

import 'activity_enrtity.dart';

class ActivityDetailsEntity extends Equatable {
  final ActivityEntity activityEntity;
  final List<ActivitiesEntity> activitiesEntity;

  const ActivityDetailsEntity({
    required this.activityEntity,
    required this.activitiesEntity,
  });

  @override
  List<Object?> get props => [activityEntity, activitiesEntity];
}
