import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/domain/repositories/gallery_repository.dart';

class GalleryImagesUseCase {
  GalleryImagesUseCase({
    required this.galleryRepository,
  });

  final GalleryRepository galleryRepository;

  Future<Either<Failure, List<String?>>> getGalleryImages() async {
    return await galleryRepository.getGalleryImages();
  }
}
