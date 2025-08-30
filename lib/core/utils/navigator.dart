import 'package:flutter/material.dart';

void navigateAndKeepStack(BuildContext context, Widget targetRoute) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => targetRoute,
      ),
    );



void navigateAndClearStack(BuildContext context, Widget targetRoute) =>
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => targetRoute,
      ),
    );



