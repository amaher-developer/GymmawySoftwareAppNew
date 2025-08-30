import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/data_sources/remote_data/gallery_remote_data_source/gallery_remote_data_source.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/error/failures.dart';
import '../../domain/repositories/gallery_repository.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  GalleryRepositoryImpl({
    required this.galleryRemoteDataSource,
  });

  final GalleryRemoteDataSource galleryRemoteDataSource;

  @override
  Future<Either<Failure, List<String?>>> getGalleryImages() async {
    try {
      final result = await galleryRemoteDataSource.getGalleryImages();
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }
}
