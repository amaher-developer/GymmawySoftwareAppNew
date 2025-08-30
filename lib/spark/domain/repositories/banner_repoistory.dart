import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/banner/banner_details_enrtity.dart';
import '../entities/banner/banners_entity.dart';

abstract class BannersRepository {
  Future<Either<Failure, List<BannersEntity>>> banners(String lang);

  Future<Either<Failure, BannerDetailsEntity>> bannerDetails(
      String lang, int bannersId, int type);
}
