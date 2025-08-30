import 'package:zone/spark/data/models/Single_message_response.dart';
import 'package:zone/spark/data/models/activty/activities_model.dart';
import 'package:zone/spark/data/models/activty/activity_details_model.dart';

abstract class ActivitiesRemoteDataSource {
  Future<List<ActivitiesModel>> activities(String lang);

  Future<ActivityDetailsModel> activityDetails(String lang, int activityId);
  // reseravtion of activity
  Future<SingleMessageResponse> reserveActivity(int activityId);
}
