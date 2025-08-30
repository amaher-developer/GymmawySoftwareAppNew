part of splash_cubit;

abstract class SplashState extends Equatable {}

class SplashInitialState extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashLoadingState extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashErrorState extends SplashState {
  final String message;
  SplashErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class SplashSuccessState extends SplashState {
  final SplashEntity splashEntity;

  SplashSuccessState({
    required this.splashEntity,
  });

  @override
  List<Object?> get props => [splashEntity];
}
