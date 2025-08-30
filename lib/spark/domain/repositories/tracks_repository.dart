import 'package:dartz/dartz.dart';
import 'package:zone/spark/domain/entities/traks/traks_entity.dart';

import '../../../core/error/failures.dart';

abstract class TracksRepository {
  Future<Either<Failure, List<TrackEntity?>>> getTracks();
}
