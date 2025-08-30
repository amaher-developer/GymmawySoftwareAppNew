import 'package:zone/spark/data/models/banner/banner_model.dart';
import 'package:zone/spark/data/models/banner/banners_model.dart';

import '../../../domain/entities/banner/banner_details_enrtity.dart';

class BannerDetailsModel extends BannerDetailsEntity {
  const BannerDetailsModel({
    required BannerModel bannerModel,
    required List<BannersModel> bannersModel,
  }) : super(
          bannerEntity: bannerModel,
          bannersEntity: bannersModel,
        );

  factory BannerDetailsModel.fromJson(Map<String, dynamic> json) {
    return BannerDetailsModel(
      bannerModel: BannerModel.modelFromSnapShot(json['banner']),
      bannersModel: BannersModel.modelFromSnapShot(json['banners']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner'] = bannerEntity;
    data['banners'] = bannersEntity;
    return data;
  }

  // model from snapshot
  static BannerDetailsModel modelFromSnapShot(Map<String, dynamic> snapShot) {
    BannerDetailsModel bannerDetails =
        BannerDetailsModel.fromJson(snapShot['result']);
    return bannerDetails;
  }
}
