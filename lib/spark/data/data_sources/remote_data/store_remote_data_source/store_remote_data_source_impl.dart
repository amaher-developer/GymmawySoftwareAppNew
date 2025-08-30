// Home data source

import 'package:zone/spark/data/data_sources/remote_data/store_remote_data_source/store_remote_data_source.dart';
import 'package:zone/spark/data/models/activty/activity_details_model.dart';
import 'package:zone/spark/data/models/store/store_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import '../../../../../core/network/api_constants.dart';

class StoreRemoteDataSourceImpl implements StoreRemoteDataSource {
  StoreRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<StoresModel?>> getStoreProducts() async {
    try {
      final response = await dio.post(
        ApiConstants.storeProducts,
        data: {
          "lang": UserHelper.getLanguage(),
        },
      );

      if (response.data['message'] == 'OK') {
        return StoresModel.modelFromSnapShot(response.data['result']["stores"]);
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      print(' *********  exception is ********** : $exception');
      rethrow;
    }
  }

  @override
  Future<ActivityDetailsModel> storeDetails(String lang, int storeId) async {
    try {
      final response = await dio.post(
        'store/$storeId',
        queryParameters: {'Accept': 'application/json'},
        data: {"lang": UserHelper.getLanguage()},
      );

      if (response.data['success'] == true) {
        return ActivityDetailsModel.modelFromSnapShot(response.data,
            fromStoreDataSource: true);
      }
      throw CustomException.unKnownException(response.data['message']);
    } catch (exception) {
      rethrow;
    }
  }
}
