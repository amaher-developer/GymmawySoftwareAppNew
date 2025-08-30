import 'package:zone/spark/data/models/banner/banners_model.dart';

import '../../../models/banner/banner_details_model.dart';

abstract class BannersRemoteDataSource {
  Future<List<BannersModel>> banners(String lang);

  Future<BannerDetailsModel> bannerDetails(
      String lang, int bannersId, int type);
}
