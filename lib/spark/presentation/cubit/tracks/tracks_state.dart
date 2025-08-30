import 'package:zone/spark/domain/entities/traks/traks_entity.dart';
import 'package:equatable/equatable.dart';

abstract class TracksState extends Equatable {
  const TracksState();
}

class TracksInitial extends TracksState {
  @override
  List<Object> get props => [];
}

class TracksLoadingState extends TracksState {
  @override
  List<Object?> get props => [];
}

class TracksErrorState extends TracksState {
  final String message;

  const TracksErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class TracksSuccessState extends TracksState {
  final List<TrackEntity?> tracks;

  const TracksSuccessState({
    required this.tracks,
  });

  @override
  List<Object?> get props => [tracks];
}
