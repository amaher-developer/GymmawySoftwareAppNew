import 'package:zone/core/network/api_constants.dart';
import 'package:zone/spark/domain/entities/activity/activity_details_enrtity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/Single_message_response.dart';
import '../../../../domain/usecases/activites_use_case/get_activity_details_use_case.dart';
import '../../../../domain/usecases/activites_use_case/reserve_activity_use_case.dart';

part 'activity_details_state.dart';

class ActivityDetailsCubit extends Cubit<ActivityDetailsState> {
  final GetActivityDetailsUseCase getActivityDetailsUseCase;
  final ReserveActivityUseCase reserveActivityUseCase;
  static ActivityDetailsCubit get(BuildContext context) =>
      BlocProvider.of(context);
  ActivityDetailsCubit({
    required this.reserveActivityUseCase,
    required this.getActivityDetailsUseCase,
  }) : super(ActivityDetailsInitial());

  Future<void> getActivityDetails(int activityId) async {
    emit(ActivityDetailsLoadingState());
    final result =
        await getActivityDetailsUseCase(ApiConstants.arLang, activityId);

    result.fold(
      (failure) {
        emit(ActivityDetailsErrorState(
          message: failure.toError().message,
        ));
      },
      (activityDetails) async {
        emit(ActivityDetailsSuccessState(activityDetails: activityDetails));
      },
    );
  }

  // reserve activity
  Future<void> reserveActivity(int activityId) async {
    emit(ActivityDetailsLoadingState());
    final result = await reserveActivityUseCase(activityId: activityId);
    result.fold(
      (failure) {
        emit(ErrorReserveActivityState(
          message: failure.toError().message,
        ));
      },
      (reservation) async {
        emit(SuccessReserveActivityState(reservation: reservation));
      },
    );
  }
}
