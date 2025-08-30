import 'package:flutter/material.dart';

import '../../../../core/widgets/login_register_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginSparkWidget(
      fromLogin: true,
    );
  }
}
