import 'package:flutter/widgets.dart';

@immutable
abstract class SharedState {
  const SharedState();
}

class InitialSharedState extends SharedState {}

class LoadingSharedState extends SharedState {}

class ReloadingSharedState extends SharedState {}

class SuccessSharedState extends SharedState {}

class UpdateState extends SharedState {}

class ErrorSharedState extends SharedState {
  final String error;

  const ErrorSharedState(this.error);
}
