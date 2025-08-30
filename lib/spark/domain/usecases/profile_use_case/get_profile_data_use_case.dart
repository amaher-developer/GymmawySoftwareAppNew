import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/models/profile/profile_model.dart';
import 'package:zone/spark/domain/repositories/profile_repoistory.dart';

import '../../../../../core/error/failures.dart';
import '../../../data/models/Single_message_response.dart';

class GetProfileDataUseCase {
  final ProfileRepository profileRepository;

  GetProfileDataUseCase({required this.profileRepository});

  Future<Either<Failure, ProfileModel>> call() async {
    return await profileRepository.profileData();
  }

  // delete account
  Future<Either<Failure, SingleMessageResponse>> deleteAccount() async {
    return await profileRepository.deleteAccount();
  }
  // freeze account
  Future<Either<Failure, SingleMessageResponse>> freezeAccount() async {
    return await profileRepository.freezeAccount();
  }
}