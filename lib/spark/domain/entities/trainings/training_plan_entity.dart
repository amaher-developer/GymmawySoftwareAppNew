import 'package:equatable/equatable.dart';

class PlanEntity extends Equatable {
  final int id;
  final String title;
  final String image;
  final String planDetails;
  final String date;

  const PlanEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.planDetails,
    required this.date,
  });

  @override
  List<Object?> get props => [id, title, image, planDetails, date];
}
