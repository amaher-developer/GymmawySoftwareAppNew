import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/data/models/store/store_model.dart';
import 'package:zone/spark/domain/repositories/store_repository.dart';

class StoreUseCase {
  StoreUseCase({
    required this.storeRepository,
  });

  final StoreRepository storeRepository;

  Future<Either<Failure, List<StoresModel?>>> getStoreProducts() async {
    return await storeRepository.getStoreProducts();
  }
}
