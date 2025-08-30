import 'package:equatable/equatable.dart';

class UserLoginEntity extends Equatable {
  final String token;
  final int userId;
  final String userName;
  final String userPhone;
  final String userImage;
  final int invitations;
  final String codeUrl;
  final String code;
  final String subscriptionName;
  final String amountPaid;
  final String amountRemaining;
  final String joiningDate;
  final String expireDate;
  final String attendeesCount;
  final String membershipStatus;

  UserLoginEntity({
    required this.token,
    required this.userId,
    required this.userName,
    required this.userPhone,
    required this.userImage,
    required this.invitations,
    required this.codeUrl,
    required this.code,
    required this.subscriptionName,
    required this.amountPaid,
    required this.amountRemaining,
    required this.joiningDate,
    required this.expireDate,
    required this.attendeesCount,
    required this.membershipStatus,
  });

  /*
 {
         "token": "4jzrLooNqodz17LCp28aNlBdXia0yYcLe4mPlDwUkJrUz2lCBBRE8EZ3nvwR",
        "json": {
            "id": 405,
            "name": "سامر سعيد السيابي",
            "phone": "99565898",
            "image": "https://sw.gymmawy.com/uploads/settings/default.jpg",
            "invitations": 0,
            "code_url": "https://sw.gymmawy.com/uploads/qrcodes/000000000405.png",
            "code": "000000000405",
            "subscription_id": 1,
            "subscription_name": "الشهري",
            "amount_paid": "10.5 ريال ",
            "amount_remaining": "0 ريال ",
            "joining_date": "2023-05-12 22:00:00",
            "expire_date": "2023-06-11 22:00:00",
            "attendees_count": "7",
            "membership_status": "نشط"
        }


}

 **/
  // from json
  factory UserLoginEntity.fromJson(Map<String, dynamic> json) {
    return UserLoginEntity(
      token: json['token'],
      userId: json['id'],
      userName: json['name'],
      userPhone: json['phone'],
      userImage: json['image'],
      invitations: json['invitations'],
      codeUrl: json['code_url'],
      code: json['code'],
      subscriptionName: json['subscription_name'],
      amountPaid: json['amount_paid'],
      amountRemaining: json['amount_remaining'],
      joiningDate: json['joining_date'],
      expireDate: json['expire_date'],
      attendeesCount: json['attendees_count'],
      membershipStatus: json['membership_status'],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': userId,
      'name': userName,
      'phone': userPhone,
      'image': userImage,
      'invitations': invitations,
      'code_url': codeUrl,
      'code': code,
      'subscription_name': subscriptionName,
      'amount_paid': amountPaid,
      'amount_remaining': amountRemaining,
      'joining_date': joiningDate,
      'expire_date': expireDate,
      'attendees_count': attendeesCount,
      'membership_status': membershipStatus,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        token,
        userId,
        userName,
        userPhone,
        userImage,
        invitations,
        codeUrl,
        code,
        subscriptionName,
        amountPaid,
        amountRemaining,
        joiningDate,
        expireDate,
        attendeesCount,
        membershipStatus,
      ];
}
