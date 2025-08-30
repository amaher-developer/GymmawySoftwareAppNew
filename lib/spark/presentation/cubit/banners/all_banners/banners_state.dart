part of 'banners_cubit.dart';

abstract class BannersState extends Equatable {
  const BannersState();
}

class BannersInitial extends BannersState {
  @override
  List<Object> get props => [];
}
class BannersLoadingState extends BannersState {
  @override
  List<Object?> get props => [];
}

class BannersErrorState extends BannersState {
  final String message;

  const BannersErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class BannersSuccessState extends BannersState {
  final List<BannersEntity> banners;

  const BannersSuccessState({
    required this.banners,
  });

  @override
  List<Object?> get props => [banners];
}
