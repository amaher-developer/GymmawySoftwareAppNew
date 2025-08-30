import 'package:equatable/equatable.dart';

import '../../../domain/entities/home/home_entity.dart';

abstract class HomeStates extends Equatable {
  const HomeStates();
}

class InitialHomeState extends HomeStates {
  @override
  List<Object?> get props => [];
}

class LoadingHomeState extends HomeStates {
  @override
  List<Object?> get props => [];
}

class ReloadingHomeState extends HomeStates {
  @override
  List<Object?> get props => [];
}

class SuccessHomeState extends HomeStates {
  const SuccessHomeState({required this.homeEntity});
  final HomeEntity homeEntity;

  @override
  List<Object?> get props => [homeEntity];
}

class UpdateState extends HomeStates {
  const UpdateState();

  @override
  List<Object?> get props => [];
}

class ErrorHomeState extends HomeStates {
  final String error;

  const ErrorHomeState(this.error);

  @override
  List<Object?> get props => [error];
}
