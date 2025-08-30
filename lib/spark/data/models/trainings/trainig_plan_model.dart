import 'package:zone/spark/domain/entities/trainings/training_plan_entity.dart';

class PlanModel extends PlanEntity {
  const PlanModel({
    required int id,
    required String title,
    required String image,
    required String planDetails,
    required String date,
  }) : super(
          id: id,
          title: title,
          image: image,
          planDetails: planDetails,
          date: date,
        );

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['plan']['id'],
      title: json['plan']['title'],
      image: json['plan']['image'],
      planDetails: json['plan']['plan_details'],
      date: json['plan']['date'],
    );
  }
  static PlanModel modelFromSnapShot(Map<String, dynamic> snapShot) {
    PlanModel planModel = PlanModel.fromJson(snapShot['result']);
    return planModel;
  }
}
