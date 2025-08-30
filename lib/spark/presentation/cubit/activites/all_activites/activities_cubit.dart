import 'package:bloc/bloc.dart';
import 'package:zone/core/network/api_constants.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/activity/activties_entity.dart';
import '../../../../domain/usecases/activites_use_case/get_all_activies_use_case.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  final GetAllActivitiesUseCase getAllActivitiesUseCase;

  ActivitiesCubit({required this.getAllActivitiesUseCase})
      : super(ActivitiesInitial());

  Future<void> getAllActivities() async {
    emit(ActivitiesLoadingState());
    final result = await getAllActivitiesUseCase(ApiConstants.arLang);

    result.fold(
      (failure) {
        emit(ActivitiesErrorState(
          message: failure.toError().message,
        ));
      },
      (activities) async {
        emit(ActivitiesSuccessState(activities: activities));
      },
    );
  }
}
