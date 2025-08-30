import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/domain/entities/trak_details/trak_details_entity.dart';
import 'package:zone/spark/domain/repositories/track_details_repository.dart';

class TrackDetailsUseCase {
  TrackDetailsUseCase({
    required this.trackDetailsRepository,
  });

  final TrackDetailsRepository trackDetailsRepository;

  Future<Either<Failure, TrackDetailsEntity?>> getTrackDetails({
    required int id,
  }) async {
    return await trackDetailsRepository.getTrackDetails(id: id);
  }
}
