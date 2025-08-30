part of 'banner_details_cubit.dart';

abstract class BannerDetailsState extends Equatable {
  const BannerDetailsState();
}

class BannerDetailsInitial extends BannerDetailsState {
  @override
  List<Object> get props => [];
}
class BannerDetailsLoadingState extends BannerDetailsState {
  @override
  List<Object?> get props => [];
}

class  BannerDetailsErrorState extends BannerDetailsState {
  final String message;

  const BannerDetailsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class  BannerDetailsSuccessState extends BannerDetailsState {
  final BannerDetailsEntity bannerDetails;

  const BannerDetailsSuccessState({
    required this.bannerDetails,
  });

  @override
  List<Object?> get props => [bannerDetails];
}
