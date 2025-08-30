import 'package:zone/spark/domain/entities/banner/banners_entity.dart';
import 'package:equatable/equatable.dart';

import 'banner_enrtity.dart';

class BannerDetailsEntity extends Equatable {
  final BannerEntity bannerEntity;
  final List<BannersEntity> bannersEntity;

  const BannerDetailsEntity({
    required this.bannerEntity,
    required this.bannersEntity,
  });

  @override
  List<Object?> get props => [bannerEntity, bannersEntity];
}
