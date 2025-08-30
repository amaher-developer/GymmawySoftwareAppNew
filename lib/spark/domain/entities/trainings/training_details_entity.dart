
import 'package:equatable/equatable.dart';

class TrainingEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final String price;
  final String classes;
  final String content;
  final int isReserved;
  final String payment_link;
  final int is_payment;
  final List<Trainer> trainers;

  TrainingEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.classes,
    required this.content,
    required this.isReserved,
    required this.trainers,
    required this.is_payment,
    required this.payment_link
  });

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    price,
    classes,
    content,
    isReserved,
    trainers,
    payment_link,
    is_payment
  ];
}

class Trainer {
  final int id;
  final String name;
  final String phone;
  final int isCompleted;
  final String isCompleteMsg;
  final String image;
  final List<Reservation> reservations;

  Trainer({
    required this.id,
    required this.name,
    required this.phone,
    required this.isCompleted,
    required this.isCompleteMsg,
    required this.image,
    required this.reservations,
  });
}

class Reservation {
  final String day;
  final String timeFrom;
  final String timeTo;

  Reservation({
    required this.day,
    required this.timeFrom,
    required this.timeTo,
  });
}