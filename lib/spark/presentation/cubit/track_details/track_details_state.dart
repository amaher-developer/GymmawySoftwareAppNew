import 'package:zone/spark/domain/entities/trak_details/trak_details_entity.dart';
import 'package:equatable/equatable.dart';

abstract class TrackDetailsState extends Equatable {
  const TrackDetailsState();
}

class TrackDetailsInitial extends TrackDetailsState {
  @override
  List<Object> get props => [];
}

class TrackDetailsLoadingState extends TrackDetailsState {
  @override
  List<Object?> get props => [];
}

class TrackDetailsErrorState extends TrackDetailsState {
  final String message;

  const TrackDetailsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class TrackDetailsSuccessState extends TrackDetailsState {
  final TrackDetailsEntity? trackDetailsEntity;

  const TrackDetailsSuccessState({
    required this.trackDetailsEntity,
  });

  @override
  List<Object?> get props => [trackDetailsEntity];
}
