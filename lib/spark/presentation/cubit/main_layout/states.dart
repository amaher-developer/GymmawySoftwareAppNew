abstract class MainLayoutStates {}

class InitialMainLayoutStates extends MainLayoutStates {}

class LoadingMainLayoutStates extends MainLayoutStates {}

class SuccessMainLayoutStates extends MainLayoutStates {}

class ErrorMainLayoutStates extends MainLayoutStates {
  final String error;

  ErrorMainLayoutStates(this.error);
}
