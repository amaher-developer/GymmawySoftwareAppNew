import '../../../domain/entities/trainings/training_details_entity.dart';

class TrainingModel extends TrainingEntity {
  TrainingModel({
    required int id,
    required String name,
    required String image,
    required String price,
    required String content,
    required String classes,
    required int isReserved,
    required String payment_link,
    required int is_payment,
    required List<Trainer> trainers,
  }) : super(
          id: id,
          name: name,
          image: image,
          price: price,
          content: content,
          classes: classes,
          isReserved: isReserved,
          trainers: trainers,
          payment_link:payment_link,
          is_payment:is_payment,
        );

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      id: json['training']['id'],
      name: json['training']['name'],
      image: json['training']['image'],
      price: json['training']['price'],
      classes: json['training']['classes'],
      content: json['training']['content'],
      payment_link: json['training']['payment_link'],
      is_payment: json['training']['is_payment'],
      isReserved: json['training']['is_reserved'],
      trainers: List<Trainer>.from(
        json['training']['trainers'].map(
          (trainer) => Trainer(
            id: trainer['id'],
            name: trainer['name'],
            phone: trainer['phone'],
            isCompleted: int.parse(trainer['is_completed']),
            isCompleteMsg: trainer['is_complete_msg'],
            image: trainer['image'],
            reservations: List<Reservation>.from(
              trainer['reservations'].map(
                (reservation) => Reservation(
                  day: reservation['day'],
                  timeFrom: reservation['time_from'],
                  timeTo: reservation['time_to'],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // model from snapshot
  static TrainingModel modelFromSnapShot(Map<String, dynamic> snapShot) {
    TrainingModel trainingModel = TrainingModel.fromJson(snapShot['result']);
    return trainingModel;
  }
}
