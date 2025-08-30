import '../../../models/Single_message_response.dart';
import '../../../models/profile/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> profileData();
  // delete account
  Future<SingleMessageResponse> deleteAccount();

  Future<SingleMessageResponse> freezeAccount();

}
