import 'package:dartz/dartz.dart';
import 'package:zone/spark/domain/entities/banner/banners_entity.dart';
import 'package:zone/spark/domain/repositories/banner_repoistory.dart';

import '../../../../../core/error/failures.dart';
import '../../../../core/use_cases/base_use_case.dart';

class GetAllBannersUseCase extends BaseUseCase<String, List<BannersEntity>> {
  final BannersRepository bannersRepository;

  GetAllBannersUseCase({required this.bannersRepository});

  @override
  Future<Either<Failure, List<BannersEntity>>> call(String input) async {
    return await bannersRepository.banners(input);
  }
}
