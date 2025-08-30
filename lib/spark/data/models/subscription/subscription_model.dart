/*
 {
                "id": 31,
                "name": "فريق الأخوة",
                "image": "https://gymmawy.com/resources/assets/front/img/preview_icon.png",
                "price": "8 ريال ",
                "is_discount": 1,
                "discount": "وفر 1 ريال",
                "shor_description": "متاح لجميع الصالة مع 1 حصص تدريبية"
  },*/

class SubscriptionModel {
  int? id;
  String? name;
  String? image;
  String? price;
  int? isDiscount;
  String? discount;
  String? shortDescription;

  SubscriptionModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.isDiscount,
    this.discount,
    this.shortDescription,
  });

  // from json
  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      isDiscount: json['is_discount'],
      discount: json['discount'],
      shortDescription: json['shor_description'],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['is_discount'] = isDiscount;
    data['discount'] = discount;
    data['shor_description'] = shortDescription;
    return data;
  }

  static List<SubscriptionModel> modelFromSnapShot(List<dynamic> snapShot) {
    List<SubscriptionModel> subscriptionData =
        snapShot.map((json) => SubscriptionModel.fromJson(json)).toList();
    return subscriptionData;
  }
}
