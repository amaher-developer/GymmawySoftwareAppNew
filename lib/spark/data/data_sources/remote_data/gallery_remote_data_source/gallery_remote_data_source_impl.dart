// Home data source

import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import '../../../../../core/network/api_constants.dart';
import 'gallery_remote_data_source.dart';

class GalleryRemoteDataSourceImpl implements GalleryRemoteDataSource {
  GalleryRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<String?>> getGalleryImages() async {
    try {
      final response = await dio.post(
        ApiConstants.gallery,
        data: {
          "lang": UserHelper.getLanguage(),
        },
      );

      if (response.data['message'] == 'OK') {
        return List.from(response.data['result']["gallery"]).cast<String?>();
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      print(' *********  exception is ********** : $exception');
      rethrow;
    }
  }
}
