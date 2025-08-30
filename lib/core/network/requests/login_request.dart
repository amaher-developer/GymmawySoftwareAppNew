class LoginRequest {
  final String phone;
  final String code;
  final String deviceToken;
  final String deviceType;

  LoginRequest({
    required this.phone,
    required this.code,
    required this.deviceToken,
    required this.deviceType,
  });
}
