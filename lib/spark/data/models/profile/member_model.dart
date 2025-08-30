import 'package:zone/core/extensions/date_helper_extensions.dart';

import '../../../domain/entities/profile/member_entity.dart';

class MemberModel extends MemberEntity {
  MemberModel({
    int? id,
    String? name,
    String? phone,
    String? image,
    int? invitations,
    String? codeUrl,
    String? code,
    String? subscriptionName,
    int? subscriptionId,
    String? amountPaid,
    String? amountRemaining,
    String? joiningDate,
    String? expireDate,
    String? attendeesCount,
    String? membershipStatus,
    int? freezeCheck,
  }) : super(
    id: id,
    name: name,
    subscriptionId: subscriptionId,
    phone: phone,
    image: image,
    invitations: invitations,
    codeUrl: codeUrl,
    code: code,
    subscriptionName: subscriptionName,
    amountPaid: amountPaid,
    amountRemaining: amountRemaining,
    joiningDate: joiningDate,
    expireDate: expireDate,
    attendeesCount: attendeesCount,
    membershipStatus: membershipStatus,
    freezeCheck: freezeCheck,
  );

  // fromJson
  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      image: json['image'],
      invitations: json['invitations'],
      codeUrl: json['code_url'],
      code: json['code'],
      subscriptionName: json['subscription_name'],
      subscriptionId: json['subscription_id'],
      amountPaid: json['amount_paid'],
      amountRemaining: json['amount_remaining'],
      joiningDate: DateTime.tryParse(json['joining_date'])?.dateOnlyText,
      expireDate: DateTime.tryParse(json['expire_date'])?.dateOnlyText,
      attendeesCount: json['attendees_count'],
      membershipStatus: json['membership_status'],
      freezeCheck: json['freeze_check'],
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['image'] = image;
    data['invitations'] = invitations;
    data['code_url'] = codeUrl;
    data['code'] = code;
    data['subscription_name'] = subscriptionName;
    data['subscription_id'] = subscriptionId;
    data['amount_paid'] = amountPaid;
    data['amount_remaining'] = amountRemaining;
    data['joining_date'] = joiningDate;
    data['expire_date'] = expireDate;
    data['attendees_count'] = attendeesCount;
    data['membership_status'] = membershipStatus;
    data['freeze_check'] = freezeCheck;
    return data;
  }
}