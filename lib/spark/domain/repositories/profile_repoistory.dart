import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/models/Single_message_response.dart';
import 'package:zone/spark/data/models/profile/profile_model.dart';

import '../../../core/error/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> profileData();
  // delete account
  Future<Either<Failure, SingleMessageResponse>> deleteAccount();
  // freeze account
  Future<Either<Failure, SingleMessageResponse>> freezeAccount();
}