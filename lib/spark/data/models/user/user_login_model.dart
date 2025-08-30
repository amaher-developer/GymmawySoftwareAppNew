import '../../../domain/entities/user/user_login_entity.dart';

class UserLoginModel extends UserLoginEntity {
  UserLoginModel({
    required String token,
    required int userId,
    required String name,
    required String phone,
    required String image,
    required int invitations,
    required String codeUrl,
    required String code,
    required String subscriptionName,
    required String amountPaid,
    required String amountRemaining,
    required String joiningDate,
    required String expireDate,
    required String attendeesCount,
    required String membershipStatus,
  }) : super(
          token: token,
          userId: userId,
          userName: name,
          userPhone: phone,
          userImage: image,
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
        );

  factory UserLoginModel.fromJson(String token, Map<String, dynamic> member) {
    return UserLoginModel(
      token: token,
      userId: member['id'],
      name: member['name'],
      phone: member['phone'],
      image: member['image'],
      invitations: member['invitations'],
      codeUrl: member['code_url'],
      code: member['code'],
      subscriptionName: member['subscription_name'],
      amountPaid: member['amount_paid'],
      amountRemaining: member['amount_remaining'],
      joiningDate: member['joining_date'],
      expireDate: member['expire_date'],
      attendeesCount: member['attendees_count'],
      membershipStatus: member['membership_status'],
    );
  }

  static UserLoginModel modelFromSnapShot(Map<String, dynamic> snapShot) {
    final Map<String, dynamic> result = snapShot['result'];
    final String token = result['token'];
    final Map<String, dynamic> member = result['member'];
    return UserLoginModel.fromJson(token, member);
  }
}
