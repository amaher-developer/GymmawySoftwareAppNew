import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/home/home_entity.dart';

import '../repositories/home_repository.dart';

class GetAllHomeDataUseCase {
  final HomeRepository homeRepository;

  GetAllHomeDataUseCase({required this.homeRepository});

  Future<Either<Failure, HomeEntity>> call() async {
    return await homeRepository.getHomeData();
  }
}
