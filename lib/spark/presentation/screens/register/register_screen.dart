import 'package:flutter/material.dart';

import '../../../../core/widgets/login_register_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    Key? key,
    this.isFromTraining,
    this.isFromSubscription,
    this.id = -1,
    this.fromProfile = false,
  }) : super(key: key);
  final bool fromProfile;
  final bool? isFromTraining;
  final bool? isFromSubscription;
  final int id;

  @override
  Widget build(BuildContext context) {
    return LoginSparkWidget(
      fromLogin: false,
      fromProfile: fromProfile,
      isFromTraining: isFromTraining,
      isFromSubscription: isFromSubscription,
      id: id,
    );
  }
}
