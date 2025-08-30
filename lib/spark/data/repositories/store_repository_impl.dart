import 'package:dartz/dartz.dart';
import 'package:zone/spark/data/models/activty/activity_details_model.dart';
import 'package:zone/spark/domain/entities/activity/activity_details_enrtity.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/error/failures.dart';
import '../../domain/repositories/store_repository.dart';
import '../data_sources/remote_data/store_remote_data_source/store_remote_data_source.dart';
import '../models/store/store_model.dart';

class StoreRepositoryImpl implements StoreRepository {
  StoreRepositoryImpl({
    required this.storeRemoteDataSource,
  });

  final StoreRemoteDataSource storeRemoteDataSource;

  @override
  Future<Either<Failure, List<StoresModel?>>> getStoreProducts() async {
    try {
      final result = await storeRemoteDataSource.getStoreProducts();
      return Right(result);
    } catch (exception) {
      return Left(ErrorHandler.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, ActivityDetailsEntity>> storeDetails(
      String lang, int storeId) async {
    try {
      final result = await storeRemoteDataSource.storeDetails(lang, storeId);
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }
}
