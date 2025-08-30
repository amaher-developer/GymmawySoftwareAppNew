import 'dart:developer';

import 'package:zone/spark/data/data_sources/remote_data/training_plan_remote_data_source/training_plan_remote_data_source.dart';
import 'package:zone/spark/data/models/trainings/training_plans_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import '../../../models/trainings/trainig_plan_model.dart';

class TrainingPlanRemoteDataSourceImpl implements TrainingPlanRemoteDataSource {
  Dio dio;

  TrainingPlanRemoteDataSourceImpl({required this.dio});

  @override
  Future<PlanModel> trainingPlan(String lang, int trainingPlanId) async {
    try {
      final response = await dio.post(
        'training-plan/$trainingPlanId',
        queryParameters: {'Accept': 'application/json'},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await UserHelper.getUserToken()}',
          },
        ),
        data: {"lang": UserHelper.getLanguage()},
      );
      log('response is ${response.data}');
      if (response.data['success'] == true) {
        return PlanModel.modelFromSnapShot(response.data);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<PlansModel> trainingPlans(String lang, int type) async {
    try {
      final response = await dio.post(
        'training-plan',
        queryParameters: {'Accept': 'application/json'},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await UserHelper.getUserToken()}',
          },
        ),
        data: {"lang": UserHelper.getLanguage(), "type": type},
      );
      if (response.data['success'] == true) {
        return PlansModel.modelFromSnapShot(response.data);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }
}
