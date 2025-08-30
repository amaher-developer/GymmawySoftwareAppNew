import 'package:equatable/equatable.dart';

import '../../../data/models/trainings/training_plans_model.dart';

class PlansEntity extends Equatable {
  final int currentPage;
  final int nextPage;
  final int pagesCount;
  final List<Plan> plans;

  const PlansEntity({
    required this.currentPage,
    required this.nextPage,
    required this.pagesCount,
    required this.plans,
  });

  @override
  List<Object?> get props => [currentPage, nextPage, pagesCount, plans];
}
