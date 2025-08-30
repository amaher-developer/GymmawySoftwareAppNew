import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/data_sources/remote_data/available_trainings_remote_data_source/available_trainings_remote_data_source.dart';
import 'package:zone/spark/data/models/trainings/available_trainings.dart';
import 'package:zone/spark/domain/entities/trainings/training_details_entity.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/error/failures.dart';
import '../../domain/repositories/available_trainings_repoistory.dart';
import '../models/Single_message_response.dart';

class AvailableTrainingsRepositoryImpl implements AvailableTrainingsRepository {
  AvailableTrainingsRepositoryImpl({
    required this.availableTrainingsRemoteDataSource,
  });

  final AvailableTrainingsRemoteDataSource availableTrainingsRemoteDataSource;

  @override
  Future<Either<Failure, List<AvailableTrainingModel?>>>
      getAvailableTrainings() async {
    try {
      final result =
          await availableTrainingsRemoteDataSource.getAvailableTrainingsData();
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, TrainingEntity>> trainingDetails(
      String lang, int trainingId) async {
    try {
      final result = await availableTrainingsRemoteDataSource.trainingDetails(
          lang, trainingId);
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }

  @override
  Future<Either<Failure, SingleMessageResponse?>> reserveTraining(
      {required int trainingId}) async {
    try {
      log('message in try');
      final result = await availableTrainingsRemoteDataSource.reserveTraining(
        trainingId: trainingId,
      );
      return Right(result);
    } catch (exception) {
      log('message in catch exception $exception');
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }
}
