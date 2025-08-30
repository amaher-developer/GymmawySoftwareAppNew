import 'package:dartz/dartz.dart';
import 'package:zone/core/use_cases/base_use_case.dart';

import '../../../../core/error/failures.dart';
import '../../../data/models/Single_message_response.dart';
import '../../repositories/available_trainings_repoistory.dart';

class TrainingReservationUseCase
    extends BaseUseCase<int, SingleMessageResponse?> {
  final AvailableTrainingsRepository availableTrainingsRepository;

  TrainingReservationUseCase({required this.availableTrainingsRepository});

  @override
  Future<Either<Failure, SingleMessageResponse?>> call(int input) async {
    return await availableTrainingsRepository.reserveTraining(
        trainingId: input);
  }
}
