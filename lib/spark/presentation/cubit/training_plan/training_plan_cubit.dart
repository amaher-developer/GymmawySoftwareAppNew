import 'package:bloc/bloc.dart';
import 'package:zone/spark/domain/entities/trainings/training_plan_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/api_constants.dart';
import '../../../domain/usecases/training_plan_usecase/training_plan_usecase.dart';

part 'training_plan_state.dart';

class TrainingPlanCubit extends Cubit<TrainingPlanState> {
  final GetTrainingPlanUseCase getTrainingPlanUseCase;

  TrainingPlanCubit({required this.getTrainingPlanUseCase})
      : super(TrainingPlanInitial());

  Future<void> getTrainingPlan(int trainingPlanId) async {
    emit(TrainingPlanLoadingState());
    final result =
        await getTrainingPlanUseCase(ApiConstants.arLang, trainingPlanId);

    result.fold(
      (failure) {
        emit(TrainingPlanErrorState(
          message: failure.toError().message,
        ));
      },
      (trainingPlan) async {
        emit(
          TrainingPlanSuccessState(
            planEntity: trainingPlan,
          ),
        );
      },
    );
  }
}
