import 'package:equatable/equatable.dart';

class BannersEntity extends Equatable {
  final int? id;
  final String? title;
  final String? image;
  final String? date;
  final String? newTitle;
  final int? type;

  const BannersEntity({
    this.id,
    this.title,
    this.image,
    this.date,
    this.newTitle,
    this.type,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        date,
        newTitle,
        type,
      ];
}
