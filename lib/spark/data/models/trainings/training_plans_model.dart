import '../../../domain/entities/trainings/training_plans_entitiy.dart';

class PlansModel extends PlansEntity {
  const PlansModel({
    required int currentPage,
    required int nextPage,
    required int pagesCount,
    required List<Plan> plans,
  }) : super(
          currentPage: currentPage,
          nextPage: nextPage,
          pagesCount: pagesCount,
          plans: plans,
        );

  factory PlansModel.fromJson(Map<String, dynamic> json) {
    return PlansModel(
      currentPage: json['current_page'],
      nextPage: json['next_page'],
      pagesCount: json['pages_count'],
      plans: List<Plan>.from(json['plans'].map((plan) => Plan.fromJson(plan))),
    );
  }

  // model from snapshot
  static PlansModel modelFromSnapShot(Map<String, dynamic> snapShot) {
    PlansModel plansModel = PlansModel.fromJson(snapShot['result']);
    return plansModel;
  }
}

class Plan {
  final int? id;
  final String? title;
  final String? image;
  final String? shortContent;
  final String? newTitle;

  Plan({
    this.id,
    this.title,
    this.image,
    this.shortContent,
    this.newTitle,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      shortContent: json['short_content'],
      newTitle: json['new_title'],
    );
  }
}
