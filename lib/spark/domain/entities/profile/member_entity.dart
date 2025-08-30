class MemberEntity {
  int? id;
  String? name;
  String? phone;
  String? image;
  int? invitations;
  String? codeUrl;
  String? code;
  String? subscriptionName;
  int? subscriptionId;
  String? amountPaid;
  String? amountRemaining;
  String? joiningDate;
  final DateTime? joiningDateAsDate;
  String? expireDate;
  String? attendeesCount;
  String? membershipStatus;
  int? freezeCheck = 1;

  MemberEntity({
    this.id,
    this.name,
    this.phone,
    this.image,
    this.invitations,
    this.codeUrl,
    this.code,
    this.subscriptionName,
    this.amountPaid,
    this.amountRemaining,
    this.subscriptionId,
    this.joiningDate,
    this.expireDate,
    this.attendeesCount,
    this.membershipStatus,
    this.joiningDateAsDate,
    this.freezeCheck,
  });
}