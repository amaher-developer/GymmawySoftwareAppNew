import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class GalleryRepository {
  Future<Either<Failure, List<String?>>> getGalleryImages();
}
