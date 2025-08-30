import 'package:zone/spark/data/models/banner/banner_details_model.dart';
import 'package:zone/spark/data/models/banner/banners_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import 'banners_remote_data_source.dart';

class BannersRemoteDataSourceImpl implements BannersRemoteDataSource {
  Dio dio;

  BannersRemoteDataSourceImpl({required this.dio});

  @override
  Future<BannerDetailsModel> bannerDetails(
      String lang, int bannersId, int type) async {
    try {
      final response = await dio.post(
        'banner/$bannersId',
        queryParameters: {'Accept': 'application/json'},
        data: {
          "lang": UserHelper.getLanguage(),
          "type": type,
        },
      );

      if (response.data['success'] == true) {
        return BannerDetailsModel.modelFromSnapShot(response.data);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<List<BannersModel>> banners(String lang) async {
    try {
      final response = await dio.post(
        'banners',
        queryParameters: {'Accept': 'application/json'},
        options: Options(
          headers: {
            if (UserHelper.getUserToken() != null)
              'Authorization': 'Bearer ${UserHelper.getUserToken()}',
          },
        ),
        data: {"lang": UserHelper.getLanguage()},
      );

      if (response.data['success'] == true) {
        return BannersModel.modelFromSnapShot(
            response.data['result']['banners']);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }
}
