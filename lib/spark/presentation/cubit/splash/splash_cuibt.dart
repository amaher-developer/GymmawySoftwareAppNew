library splash_cubit;

import 'package:zone/core/network/api_constants.dart';
import 'package:zone/core/network/requests/splash_request.dart';
import 'package:zone/spark/domain/entities/splash/splash_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/auth_usecase/splash_usecase.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashUseCase splashUseCase;
  SplashEntity? splashEntity;

  SplashCubit({required this.splashUseCase}) : super(SplashInitialState());
  static SplashCubit get(context) => BlocProvider.of(context);

  Future<void> getSplashData() async {
    emit(SplashLoadingState());
    final result = await splashUseCase(
      SplashRequest(
        lang: 'ar',
        deviceType: ApiConstants.deviceType,
        deviceToken: ApiConstants.deviceToken,
      ),
    );

    result.fold(
      (failure) {
        emit(SplashErrorState(
          message: failure.toError().message,
        ));
      },
      (splashDate) async {
        splashEntity = splashDate;
        emit(SplashSuccessState(splashEntity: splashDate));
      },
    );
  }
}
