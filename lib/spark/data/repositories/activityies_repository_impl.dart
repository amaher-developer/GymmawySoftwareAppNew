import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/data/data_sources/remote_data/activites_remote_data_source/activites_remote_data_source.dart';
import 'package:zone/spark/data/models/Single_message_response.dart';
import 'package:zone/spark/domain/entities/activity/activity_details_enrtity.dart';
import 'package:zone/spark/domain/entities/activity/activties_entity.dart';

import '../../../core/error/error_handler.dart';
import '../../domain/repositories/activity_repoistory.dart';

class ActivitiesRepositoryImpl implements ActivitiesRepository {
  final ActivitiesRemoteDataSource activitiesRemoteDataSource;

  ActivitiesRepositoryImpl({required this.activitiesRemoteDataSource});

  @override
  Future<Either<Failure, List<ActivitiesEntity>>> activities(
      String lang) async {
    try {
      final result = await activitiesRemoteDataSource.activities(lang);
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }

  @override
  Future<Either<Failure, ActivityDetailsEntity>> activityDetails(
      String lang, int activityId) async {
    try {
      final result =
          await activitiesRemoteDataSource.activityDetails(lang, activityId);
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }

  @override
  Future<Either<Failure, SingleMessageResponse>> reserveActivity(
      int activityId) async {
    try {
      final result =
          await activitiesRemoteDataSource.reserveActivity(activityId);
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }
}
