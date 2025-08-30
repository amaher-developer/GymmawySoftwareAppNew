import 'package:zone/core/network/api_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/helper/user_helper.dart';
import '../../../../core/network/requests/login_request.dart';
import '../../../domain/entities/user/user_login_entity.dart';
import '../../../domain/usecases/auth_usecase/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final phoneController = TextEditingController();
  final codeController = TextEditingController();
  final phoneFocusNode = FocusNode();
  final codeFocusNode = FocusNode();
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  LoginCubit({
    required this.loginUseCase,
  }) : super( LoginState());

  Future<void> login() async {
    String? deviceToken = '';
    emit(
      state.copyWith(
        loginState: RequestState.loading,
        isPhoneValid: true,
        isCodeValid: true,
        isOtherError: false,
      ),
    );
    await FirebaseMessaging.instance.getToken().then((value) {
      deviceToken = value;
    });
    final result = await loginUseCase(
      LoginRequest(
        phone: phoneController.text,
        code: codeController.text,
        deviceType: ApiConstants.deviceType,
        deviceToken: deviceToken ?? '',
      ),
    );
    result.fold(
      (failure) {
        if (failure.toError().message.toLowerCase().contains('phone')) {
          emit(
            state.copyWith(
              loginState: RequestState.error,
              loginMessage: failure.toError().message,
              isPhoneValid: false,
            ),
          );
        } else if (failure.toError().message.toLowerCase().contains('code')) {
          emit(
            state.copyWith(
              loginState: RequestState.error,
              loginMessage: failure.toError().message,
              isCodeValid: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              loginState: RequestState.error,
              loginMessage: failure.toError().message,
              isOtherError: true,
            ),
          );
        }
      },
      (user) async {
        ApiConstants.token = user.token;
        emit(
          state.copyWith(
            user: user,
            loginState: RequestState.success,
          ),
        );
        await UserHelper.setUser(user: user);
      },
    );
  }

  void initUser(UserLoginEntity? user) {
    emit(
      state.copyWith(
        user: user,
      ),
    );
  }

  void changeLoginFormState() {
    emit(
      state.copyWith(
        isLoginFormValid:
            phoneController.text.isNotEmpty && codeController.text.isNotEmpty,
      ),
    );
  }
}
