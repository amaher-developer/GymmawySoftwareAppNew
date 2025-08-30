import 'banners_entity.dart';

class BannerEntity extends BannersEntity {
  final String? content;
  final String? phone;
  final String? url;

  const BannerEntity({
    int? id,
    String? title,
    String? image,
    this.content,
    this.phone,
    this.url,
  }) : super(
          id: id,
          title: title,
          image: image,
        );

  @override
  List<Object?> get props => [id, title, image, content, phone, url];
}
