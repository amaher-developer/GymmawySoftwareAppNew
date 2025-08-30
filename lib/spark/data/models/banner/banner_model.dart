import '../../../domain/entities/banner/banner_enrtity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    required int id,
    required String title,
    required String image,
    required String content,
    required String phone,
    required String url,
  }) : super(
          id: id,
          title: title,
          image: image,
          content: content,
          phone: phone,
          url: url,
        );

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      content: json['content'],
      phone: json['phone'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['content'] = content;
    data['phone'] = phone;
    data['url'] = url;
    return data;
  }

  // model from snapshot
  static BannerModel modelFromSnapShot(Map<String, dynamic> snapShot) {
    BannerModel banner = BannerModel.fromJson(snapShot);
    return banner;
  }
}
