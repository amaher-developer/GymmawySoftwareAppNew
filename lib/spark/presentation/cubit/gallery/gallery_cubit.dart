import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/gallery_usecase/gallery_usecase.dart';
import 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryStates> {
  final GalleryImagesUseCase galleryImagesUseCase;
  List<String?> galleryList = [];

  GalleryCubit({required this.galleryImagesUseCase})
      : super(InitialGalleryStates());

  static GalleryCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getGalleryImages() async {
    emit(LoadingGalleryStates());
    final result = await galleryImagesUseCase.getGalleryImages();
    result.fold(
      (failure) => emit(ErrorGalleryStates(failure.toError().message)),
      (gallery) {
        galleryList = gallery;
        emit(SuccessGalleryStates(gallery: gallery));
      },
    );
  }

  updateState() {
    emit(UpdateState());
  }
}
