import 'package:zone/spark/data/models/profile/member_model.dart';

class ProfileEntity {
  MemberModel? member;
  int? isAttendees;
  int? isTrainingPlans;
  int? isTrainingTracks;
  int? isPtTrainings;

  ProfileEntity({
    this.member,
    this.isAttendees,
    this.isTrainingPlans,
    this.isTrainingTracks,
    this.isPtTrainings,
  });
}
