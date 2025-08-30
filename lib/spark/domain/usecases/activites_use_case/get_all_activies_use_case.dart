import 'package:dartz/dartz.dart';
import 'package:zone/spark/domain/repositories/activity_repoistory.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/activity/activties_entity.dart';

class GetAllActivitiesUseCase {
  final ActivitiesRepository activitiesRepository;

  GetAllActivitiesUseCase({required this.activitiesRepository});

  Future<Either<Failure, List<ActivitiesEntity>>> call(String lang) async {
    return await activitiesRepository.activities(lang);
  }
}
