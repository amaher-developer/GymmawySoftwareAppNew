class RegisterRequest {
  final String userName;
  final String email;
  final String password;
  final String? role;
  final String? file;

  RegisterRequest({
    required this.userName,
    required this.email,
    required this.password,
    this.role,
    this.file
  });
}
