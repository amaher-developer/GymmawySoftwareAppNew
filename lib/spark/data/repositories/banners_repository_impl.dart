import 'package:dartz/dartz.dart';
import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/data/data_sources/remote_data/banners_remote_data_source/banners_remote_data_source.dart';
import 'package:zone/spark/domain/entities/banner/banner_details_enrtity.dart';
import 'package:zone/spark/domain/entities/banner/banners_entity.dart';

import '../../../core/error/error_handler.dart';
import '../../domain/repositories/banner_repoistory.dart';

class BannersRepositoryImpl implements BannersRepository {
  final BannersRemoteDataSource bannersRemoteDataSource;

  BannersRepositoryImpl({required this.bannersRemoteDataSource});

  @override
  Future<Either<Failure, BannerDetailsEntity>> bannerDetails(
      String lang, int bannersId, int type) async {
    try {
      final result =
          await bannersRemoteDataSource.bannerDetails(lang, bannersId, type);
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }

  @override
  Future<Either<Failure, List<BannersEntity>>> banners(String lang) async {
    try {
      final result = await bannersRemoteDataSource.banners(lang);
      return Right(result);
    } catch (exception) {
      return Left(
        ErrorHandler.mapExceptionToFailure(exception),
      );
    }
  }
}
