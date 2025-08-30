import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/data_sources/remote_data/track_details_remote_data_source/track_details_remote_data_source.dart';
import 'package:zone/spark/domain/entities/trak_details/trak_details_entity.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/error/failures.dart';
import '../../domain/repositories/track_details_repository.dart';

class TrackDetailsRepositoryImpl implements TrackDetailsRepository {
  TrackDetailsRepositoryImpl({
    required this.trackDetailsRemoteDataSource,
  });

  final TrackDetailsRemoteDataSource trackDetailsRemoteDataSource;

  @override
  Future<Either<Failure, TrackDetailsEntity?>> getTrackDetails({
    required int id,
  }) async {
    try {
      final result = await trackDetailsRemoteDataSource.getTrackDetails(id: id);
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }
}
