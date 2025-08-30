import 'package:equatable/equatable.dart';

class ActivitiesEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final String price;
  final String? payment_link;
  final int? is_payment;

  const ActivitiesEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.payment_link,
    this.is_payment
  });

  @override
  List<Object?> get props => [id, name, image, price];
}
