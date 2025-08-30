part of 'login_cubit.dart';

class LoginState extends Equatable {
  final UserLoginEntity? user;
  late RequestState? loginState;
  final String loginMessage;
  final bool isLoginFormValid;
  final bool isPhoneValid;
  final bool isCodeValid;
  final bool isOtherError;

   LoginState({
    this.user,
    this.loginState,
    this.loginMessage = '',
    this.isLoginFormValid = false,
    this.isPhoneValid = true,
    this.isCodeValid = true,
    this.isOtherError = false,
  });

  LoginState copyWith({
    UserLoginEntity? user,
    RequestState? loginState,
    String? loginMessage,
    bool? isPasswordHidden,
    bool? isLoginFormValid,
    bool? isPhoneValid,
    bool? isCodeValid,
    bool? isOtherError,
  }) {
    return LoginState(
      user: user ?? this.user,
      loginState: loginState ?? this.loginState,
      loginMessage: loginMessage ?? this.loginMessage,
      isLoginFormValid: isLoginFormValid ?? this.isLoginFormValid,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isCodeValid: isCodeValid ?? this.isCodeValid,
      isOtherError: isOtherError ?? this.isOtherError,
    );
  }

  @override
  List<Object?> get props => [
        user,
        loginState,
        loginMessage,
        isLoginFormValid,
        isPhoneValid,
        isCodeValid,
        isOtherError,
      ];
}
