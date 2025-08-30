import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/trak_details/trak_details_entity.dart';

abstract class TrackDetailsRepository {
  Future<Either<Failure, TrackDetailsEntity?>> getTrackDetails({
    required int id,
  });
}
