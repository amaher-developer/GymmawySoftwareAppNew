import '../../../domain/entities/trainings/available_trainings_entity.dart';

class AvailableTrainingModel extends AvailableTrainingEntity {
  AvailableTrainingModel({
    final int? id,
    final String? name,
    final String? currency,
    final String? image,
    final String? price,
    final String? classes,
  }) : super(
          id: id,
          name: name,
          image: image,
          currency: currency,
          price: price,
          classes: classes,
        );

  factory AvailableTrainingModel.fromJson(Map<String, dynamic> json) {
    return AvailableTrainingModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      currency: json['price_unit'],
      price: json['price'],
      classes: json['classes'],
    );
  }

  static List<AvailableTrainingModel> modelFromSnapShot(List list) {
    if (list.isEmpty) return List<AvailableTrainingModel>.empty();
    return list.map((item) => AvailableTrainingModel.fromJson(item)).toList();
  }
}
