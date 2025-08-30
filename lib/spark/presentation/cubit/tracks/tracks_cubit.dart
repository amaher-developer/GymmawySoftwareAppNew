import 'package:zone/spark/domain/entities/traks/traks_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/tracks_usecase/traks_usecase.dart';
import 'tracks_state.dart';

class TracksCubit extends Cubit<TracksState> {
  static TracksCubit get(BuildContext context) => BlocProvider.of(context);

  final TracksUseCase tracksUseCase;
  List<TrackEntity?> tracks = [];

  TracksCubit({
    required this.tracksUseCase,
  }) : super(TracksInitial());

  Future<void> getTracks() async {
    emit(TracksLoadingState());
    final result = await tracksUseCase.getTracks();

    result.fold(
      (failure) {
        emit(TracksErrorState(
          message: failure.toError().message,
        ));
      },
      (tracks) async {
        this.tracks.clear();
        this.tracks = tracks;
        emit(TracksSuccessState(tracks: tracks));
        /* emit(TracksErrorState(
          message: 'failure.toError().message',
        ));*/
      },
    );
  }
// init
}
