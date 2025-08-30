class ChangePasswordRequest {
  final String userId;
  final String userName;
  final String currentPassword;
  final String newPassword;

  ChangePasswordRequest({
    required this.userId,
    required this.userName,
    required this.currentPassword,
    required this.newPassword,
  });
}
