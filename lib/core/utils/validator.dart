String? isPhoneValid(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Phone can not be empty';
  }
  return null;
}

String? isFieldValid(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return '$fieldName is required';
  }
  return null;
}

String? isPasswordValid(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password can not be empty';
  } else if (password.length < 8) {
    return 'Password must be at least 8 characters';
  }
  return null;
}

String? isPasswordConfirmValid(String? password, String? confirmPassword) {
  if (password != confirmPassword) {
    return 'Password does not match';
  }
  return null;
}

String? isNumericFieldValid(String? code, String name) {
  if (code == null || code.isEmpty) {
    return '$name is required';
  } else if (int.tryParse(code) == null) {
    return '$name can only be numbers';
  }
  return null;
}

String? isEmailValid(String? email) {
  final emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  if (email == null || email.isEmpty) {
    return 'Email is required';
  } else if (!emailRegex.hasMatch(email)) {
    return 'Invalid email';
  }
  return null;
}

String? isDoubleNumericFieldValid(String? value, String name) {
  if (value == null || value.isEmpty) {
    return '$name is required';
  } else if (double.tryParse(value) == null) {
    return '$name can only be numbers';
  }
  return null;
}

String? isUrlFieldValid(String? url) {
  if (url == null || url.isEmpty) {
    return 'Url is required';
  } else if (!url.startsWith('http://') && !url.startsWith('https://')) {
    return 'Url must begins with http(s)://';
  }
  return null;
}

String? isWithdrawAmountValid({
  required String? value,
  required String minimum,
  required double maximum,
}) {
  if (value == null || value.isEmpty) {
    return 'Amount is required';
  } else {
    var minimumDouble = double.tryParse(minimum);
    var valueDouble = double.tryParse(value);

    if (minimumDouble == null || valueDouble == null) {
      return 'Invalid amount';
    }

    if (valueDouble < minimumDouble) {
      return 'Withdraw amount must be greater than or equal to \$$minimumDouble';
    }

    if (valueDouble > maximum) {
      return 'Withdraw amount must be less than or equal to \$$maximum';
    }
  }

  return null;
}
