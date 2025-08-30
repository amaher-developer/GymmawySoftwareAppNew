import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/domain/entities/traks/traks_entity.dart';
import 'package:zone/spark/domain/repositories/tracks_repository.dart';

class TracksUseCase {
  TracksUseCase({
    required this.tracksRepository,
  });

  final TracksRepository tracksRepository;

  Future<Either<Failure, List<TrackEntity?>>> getTracks() async {
    return await tracksRepository.getTracks();
  }
}
