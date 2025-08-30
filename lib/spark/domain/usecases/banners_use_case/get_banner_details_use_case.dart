import 'package:dartz/dartz.dart';
import 'package:zone/spark/domain/entities/banner/banner_details_enrtity.dart';

import '../../../../core/error/failures.dart';
import '../../repositories/banner_repoistory.dart';

class GetBannerDetailsUseCase {
  final BannersRepository bannersRepository;

  GetBannerDetailsUseCase({required this.bannersRepository});

  Future<Either<Failure, BannerDetailsEntity>> call(
      String lang, int activityId, int type) async {
    return await bannersRepository.bannerDetails(lang, activityId, type);
  }
}
