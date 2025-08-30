import 'package:bloc/bloc.dart';
import 'package:zone/core/network/api_constants.dart';
import 'package:zone/spark/domain/usecases/banners_use_case/get_all_banners_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/banner/banners_entity.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  final GetAllBannersUseCase getAllBannersUseCase;

  BannersCubit({required this.getAllBannersUseCase}) : super(BannersInitial());

  Future<void> getAllBanners() async {
    emit(BannersLoadingState());
    final result = await getAllBannersUseCase(ApiConstants.arLang);

    result.fold(
      (failure) {
        emit(BannersErrorState(
          message: failure.toError().message,
        ));
      },
      (banners) async {
        emit(BannersSuccessState(banners: banners));
      },
    );
  }
}
