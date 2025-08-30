class StoresModel {
  final int? id;
  final String? name;
  final String? image;
  final String? price;
  final String? priceUnit;

  StoresModel({
    this.id,
    this.name,
    this.image,
    this.priceUnit,
    this.price,
  });

  factory StoresModel.fromJson(Map<String, dynamic> json) {
    return StoresModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      priceUnit: json['price_unit'],
    );
  }

  // snapshot list
  static List<StoresModel> modelFromSnapShot(List<dynamic> snapShot) {
    List<StoresModel> storesData =
        snapShot.map((json) => StoresModel.fromJson(json)).toList();
    return storesData;
  }
}
