import 'package:bloc/bloc.dart';
import 'package:zone/spark/domain/entities/banner/banner_details_enrtity.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/network/api_constants.dart';
import '../../../../domain/usecases/banners_use_case/get_banner_details_use_case.dart';

part 'banner_details_state.dart';

class BannerDetailsCubit extends Cubit<BannerDetailsState> {
  final GetBannerDetailsUseCase getBannerDetailsUseCase;

  BannerDetailsCubit({required this.getBannerDetailsUseCase})
      : super(BannerDetailsInitial());

  Future<void> getBannerDetails(int bannerId, int type) async {
    emit(BannerDetailsLoadingState());
    final result =
        await getBannerDetailsUseCase(ApiConstants.arLang, bannerId, type);

    result.fold(
      (failure) {
        emit(BannerDetailsErrorState(
          message: failure.toError().message,
        ));
      },
      (bannerDetails) async {
        emit(BannerDetailsSuccessState(bannerDetails: bannerDetails));
      },
    );
  }
}
