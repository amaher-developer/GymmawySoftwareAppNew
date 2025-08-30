import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/api_constants.dart';
import '../../../domain/entities/trainings/training_plans_entitiy.dart';
import '../../../domain/usecases/training_plan_usecase/training_plans_use_case.dart';

part 'training_plans_state.dart';

class TrainingPlansCubit extends Cubit<TrainingPlansState> {
  final GetTrainingPlansUseCase getTrainingPlansUseCase;

  TrainingPlansCubit({required this.getTrainingPlansUseCase})
      : super(TrainingPlansInitial());

  Future<void> getTrainingPlans(int type) async {
    emit(TrainingPlansLoadingState());
    final result = await getTrainingPlansUseCase(ApiConstants.arLang, type);

    result.fold(
      (failure) {
        emit(TrainingPlansErrorState(
          message: failure.toError().message,
        ));
      },
      (trainingPlans) async {
        emit(
          TrainingPlansSuccessState(
            plansEntity: trainingPlans,
          ),
        );
      },
    );
  }
}
