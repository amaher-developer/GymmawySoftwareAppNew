import 'package:zone/spark/domain/entities/trainings/training_details_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/network/api_constants.dart';
import '../../../../domain/usecases/available_trainings_usecase/get_training_details_use_case.dart';

part 'training_details_state.dart';

class TrainingDetailsCubit extends Cubit<TrainingDetailsState> {
  final GetTrainingDetailsUseCase getTrainingDetailsUseCase;

  TrainingDetailsCubit({
    required this.getTrainingDetailsUseCase,
  }) : super(TrainingDetailsInitial());

  static TrainingDetailsCubit get(context) => BlocProvider.of(context);

  Future<void> getTrainingDetails(int trainingId) async {
    emit(TrainingDetailsLoadingState());
    final result =
        await getTrainingDetailsUseCase(ApiConstants.arLang, trainingId);

    result.fold(
      (failure) {
        emit(TrainingDetailsErrorState(
          message: failure.toError().message,
        ));
      },
      (trainingDetails) async {
        emit(
          TrainingDetailsSuccessState(
            trainingDetails: trainingDetails,
          ),
        );
      },
    );
  }
}
