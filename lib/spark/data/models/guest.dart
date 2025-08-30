class GuestPhoneAndNameModel {
  String? name;
  String? phone;

  GuestPhoneAndNameModel({this.name, this.phone});

  GuestPhoneAndNameModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}
