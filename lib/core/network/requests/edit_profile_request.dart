class EditProfileRequest {
  final String userId;
  final Map<String, String> fields;

  EditProfileRequest({
    required this.userId,
    required this.fields,
  });
}
