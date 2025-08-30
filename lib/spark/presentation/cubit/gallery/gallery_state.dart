import 'package:equatable/equatable.dart';

abstract class GalleryStates extends Equatable {
  const GalleryStates();
}

class InitialGalleryStates extends GalleryStates {
  @override
  List<Object?> get props => [];
}

class LoadingGalleryStates extends GalleryStates {
  @override
  List<Object?> get props => [];
}

class ReloadingGalleryStates extends GalleryStates {
  @override
  List<Object?> get props => [];
}

class SuccessGalleryStates extends GalleryStates {
  const SuccessGalleryStates({required this.gallery});

  final List<String?> gallery;

  @override
  List<Object?> get props => [gallery];
}

class UpdateState extends GalleryStates {
  @override
  List<Object?> get props => [];
}

class ErrorGalleryStates extends GalleryStates {
  final String error;

  const ErrorGalleryStates(this.error);

  @override
  List<Object?> get props => [error];
}
