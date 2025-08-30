import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/models/traks/traks.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/error/failures.dart';
import '../../domain/repositories/tracks_repository.dart';
import '../data_sources/remote_data/tracks_remote_data_source/traks_remote_data_source.dart';

class TracksRepositoryImpl implements TracksRepository {
  TracksRepositoryImpl({
    required this.tracksRemoteDataSource,
  });

  final TracksRemoteDataSource tracksRemoteDataSource;

  @override
  Future<Either<Failure, List<TrackModel?>>> getTracks() async {
    try {
      final result = await tracksRemoteDataSource.getTracks();
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }
}
