import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/models/store/store_model.dart';
import 'package:zone/spark/domain/entities/activity/activity_details_enrtity.dart';

import '../../../core/error/failures.dart';

abstract class StoreRepository {
  Future<Either<Failure, List<StoresModel?>>> getStoreProducts();
  Future<Either<Failure, ActivityDetailsEntity>> storeDetails(
      String lang, int storeId);
}
