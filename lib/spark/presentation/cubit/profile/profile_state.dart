import 'package:equatable/equatable.dart';

import '../../../data/models/profile/profile_model.dart';

abstract class ProfileStates extends Equatable {
  const ProfileStates();
}

class InitialProfileStates extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class LoadingProfileStates extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class ReloadingProfileStates extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class SuccessProfileStates extends ProfileStates {
  const SuccessProfileStates({required this.profileUserInfo});

  final ProfileModel? profileUserInfo;

  @override
  List<Object?> get props => [profileUserInfo];
}

class UpdateState extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class ErrorProfileStates extends ProfileStates {
  final String error;

  const ErrorProfileStates(this.error);

  @override
  List<Object?> get props => [error];
}

// delete account loading and success and error
class DeleteAccountLoadingStates extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class DeleteAccountSuccessStates extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class DeleteAccountErrorStates extends ProfileStates {
  final String error;

  const DeleteAccountErrorStates(this.error);

  @override
  List<Object?> get props => [error];
}

// freeze account loading and success and error
class FreezeAccountLoadingStates extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class FreezeAccountSuccessStates extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class FreezeAccountErrorStates extends ProfileStates {
  final String error;

  const FreezeAccountErrorStates(this.error);

  @override
  List<Object?> get props => [error];
}