import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/models/activty/activity_details_model.dart';
import 'package:zone/spark/domain/entities/activity/activity_details_enrtity.dart';
import 'package:zone/spark/domain/repositories/store_repository.dart';

import '../../../../core/error/failures.dart';
import '../../repositories/activity_repoistory.dart';

class GetStoreDetailsUseCase {
  final StoreRepository storeRepository;

  GetStoreDetailsUseCase({required this.storeRepository});

  Future<Either<Failure, ActivityDetailsEntity>> call(
      String lang, int storeId) async {
    return await storeRepository.storeDetails(lang, storeId);
  }
}
