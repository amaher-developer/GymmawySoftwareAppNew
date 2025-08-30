import 'activties_entity.dart';

class ActivityEntity extends ActivitiesEntity {
  final String content;

  const ActivityEntity({
    required int id,
    required String name,
    required String image,
    required String price,
    required String payment_link,
    required int is_payment,
    required this.content,
  }) : super(
          id: id,
          name: name,
          image: image,
          price: price,
         payment_link: payment_link,
         is_payment: is_payment,
        );

  @override
  List<Object?> get props => [id, name, image, price, content,payment_link,is_payment];
}
