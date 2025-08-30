import 'package:zone/spark/domain/entities/trak_details/trak_details_entity.dart';
import 'package:zone/spark/domain/usecases/track_details_usecase/trak_details_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'track_details_state.dart';

class TrackDetailsCubit extends Cubit<TrackDetailsState> {
  static TrackDetailsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final TrackDetailsUseCase trackDetailsUseCase;
  TrackDetailsEntity? trackDetails = TrackDetailsEntity();

  TrackDetailsCubit({
    required this.trackDetailsUseCase,
  }) : super(TrackDetailsInitial());

  Future<void> getTrackDetails({required int id}) async {
    emit(TrackDetailsLoadingState());
    final result = await trackDetailsUseCase.getTrackDetails(id: id);

    result.fold(
      (failure) {
        emit(TrackDetailsErrorState(
          message: failure.toError().message,
        ));
      },
      (trackDetails) async {
        this.trackDetails = trackDetails;
        emit(TrackDetailsSuccessState(trackDetailsEntity: trackDetails));
        /* emit(TrackDetailsErrorState(
          message: 'failure.toError().message',
        ));*/
      },
    );
  }
// init
}
