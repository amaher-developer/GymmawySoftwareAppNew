/*
 {
    "result": {
        "member": {
            "id": 405,
            "name": "سامر سعيد السيابي",
            "phone": "99565898",
            "image": "https://sw.gymmawy.com/uploads/settings/default.jpg",
            "invitations": 0,
            "code_url": "https://sw.gymmawy.com/uploads/qrcodes/000000000405.png",
            "code": "000000000405",
            "subscription_name": "الشهري",
            "amount_paid": "10.5 ريال ",
            "amount_remaining": "0 ريال ",
            "joining_date": "2023-05-12 22:00:00",
            "expire_date": "2023-06-11 22:00:00",
            "attendees_count": "7",
            "membership_status": "نشط"
        },
        "is_attendees": 1,
        "is_training_plans": 1,
        "is_training_tracks": 1,
        "is_pt_trainings": 1
    },
    "status": 200,
    "success": true,
    "message": "OK"
}
* */
import 'package:zone/spark/data/models/profile/member_model.dart';

import '../../../domain/entities/profile/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    MemberModel? member,
    int? isAttendees,
    int? isTrainingPlans,
    int? isTrainingTracks,
    int? isPtTrainings,
  }) : super(
          member: member,
          isAttendees: isAttendees,
          isTrainingPlans: isTrainingPlans,
          isTrainingTracks: isTrainingTracks,
          isPtTrainings: isPtTrainings,
        );

  // fromJson
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      member:
          json['member'] != null ? MemberModel.fromJson(json['member']) : null,
      isAttendees: json['is_attendees'],
      isTrainingPlans: json['is_training_plans'],
      isTrainingTracks: json['is_training_tracks'],
      isPtTrainings: json['is_pt_trainings'],
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (member != null) {
      data['member'] = member!.toJson();
    }
    data['is_attendees'] = isAttendees;
    data['is_training_plans'] = isTrainingPlans;
    data['is_training_tracks'] = isTrainingTracks;
    data['is_pt_trainings'] = isPtTrainings;
    return data;
  }
}
