class HomeUtilsModel {
  int? id;
  String? name;
  String? image;
  String? price;
  String? title;
  String? classes;
  String? priceUnit;
  int? type;

  HomeUtilsModel({
    this.id,
    this.name,
    this.image,
    this.title,
    this.type,
    this.priceUnit,
    this.price,
    this.classes,
  });

  factory HomeUtilsModel.fromJson(Map<String, dynamic> json) {
    return HomeUtilsModel(
      id: json['id'],
      type: json['type'],
      priceUnit: json['price_unit'],
      title: json['title'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      classes: json['classes'],
    );
    json['classes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['price_unit'] = priceUnit;
    data['title'] = title;
    data['image'] = image;
    data['price'] = price;
    data['classes'] = classes;
    return data;
  }

  // model from snapshot
  static List<HomeUtilsModel> modelFromSnapShot(List<dynamic> snapShot) {
    List<HomeUtilsModel> trainingsData =
        snapShot.map((json) => HomeUtilsModel.fromJson(json)).toList();
    return trainingsData;
  }
}
