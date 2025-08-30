import 'package:zone/spark/data/models/profile/profile_model.dart';
import 'package:zone/spark/domain/usecases/profile_use_case/get_profile_data_use_case.dart';
import 'package:zone/spark/presentation/cubit/profile/profile_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/profile/member_model.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  bool hasError = false;
  final GetProfileDataUseCase getProfileDataUseCase;
  ProfileModel profileUserInfo = ProfileModel();

  MemberModel? get member => profileUserInfo.member;

  ProfileCubit({required this.getProfileDataUseCase})
      : super(InitialProfileStates());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getProfileData() async {
    emit(LoadingProfileStates());
    final result = await getProfileDataUseCase.call();
    result.fold(
          (failure) {
        emit(ErrorProfileStates(failure.toError().message));
        hasError = true;
      },
          (profileUserInfo) {
        this.profileUserInfo = profileUserInfo;
        hasError = false;
        emit(SuccessProfileStates(profileUserInfo: profileUserInfo));
      },
    );
  }

  updateState() {
    emit(UpdateState());
  }

  // delete account
  Future<void> deleteAccount() async {
    emit(DeleteAccountLoadingStates());
    final result = await getProfileDataUseCase.deleteAccount();
    result.fold(
          (failure) => emit(DeleteAccountErrorStates(failure.toError().message)),
          (singleMessageResponse) async {
        //TODO: take message to show it to user
        /* await UserHelper.clearUser();
        print('passed 1');
        Navigator.of(navigatorKey.currentContext!)
            .pushReplacementNamed(Routes.initial);
        print('passed 2');*/
        emit(DeleteAccountSuccessStates());
      },
    );
  }
  // freeze account
  Future<void> freezeAccount() async {
    emit(FreezeAccountLoadingStates());
    final result = await getProfileDataUseCase.freezeAccount();
    result.fold(
          (failure) => emit(FreezeAccountErrorStates(failure.toError().message)),
          (singleMessageResponse) async {
        //TODO: take message to show it to user
        /* await UserHelper.clearUser();
        print('passed 1');
        Navigator.of(navigatorKey.currentContext!)
            .pushReplacementNamed(Routes.initial);
        print('passed 2');*/
        getProfileData();
        emit(FreezeAccountSuccessStates());
      },
    );
  }
}