mixin ValidatorMixin {
  String? isFieldValid(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      // return '$fieldName ${LocaleKeys.emptyErrorMessage.tr()}';
    }
    return null;
  }

  String? isPasswordConfirmValid(String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      // return LocaleKeys.passwordNotMatch.tr();
    }
    return null;
  }
}
