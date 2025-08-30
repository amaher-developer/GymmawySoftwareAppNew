import 'package:zone/spark/data/models/activty/activities_model.dart';
import 'package:zone/spark/data/models/activty/activity_model.dart';

import '../../../domain/entities/activity/activity_details_enrtity.dart';

class ActivityDetailsModel extends ActivityDetailsEntity {
  const ActivityDetailsModel({
    required ActivityModel activityModel,
    required List<ActivitiesModel> activitiesModel,
  }) : super(
          activityEntity: activityModel,
          activitiesEntity: activitiesModel,
        );

  factory ActivityDetailsModel.fromJson(Map<String, dynamic> json,
      {bool? fromStoreDataSource}) {
    return ActivityDetailsModel(
      activityModel: ActivityModel.modelFromSnapShot(
          fromStoreDataSource == null ? json['activity'] : json['store']),
      activitiesModel: ActivitiesModel.modelFromSnapShot(
        fromStoreDataSource == null ? json['activities'] : json['stores'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity'] = activityEntity;
    data['activities'] = activitiesEntity;
    return data;
  }

  // model from snapshot
  static ActivityDetailsModel modelFromSnapShot(Map<String, dynamic> snapShot,
      {bool? fromStoreDataSource}) {
    ActivityDetailsModel activityDetails = ActivityDetailsModel.fromJson(
      snapShot['result'],
      fromStoreDataSource: fromStoreDataSource,
    );
    return activityDetails;
  }
}
