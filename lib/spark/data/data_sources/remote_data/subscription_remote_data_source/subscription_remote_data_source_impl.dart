// Home data source

import 'package:zone/spark/data/data_sources/remote_data/subscription_remote_data_source/subscription_remote_data_source.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import '../../../../../core/network/api_constants.dart';
import '../../../models/subscription/subscription_model.dart';

class SubscriptionRemoteDataSourceImpl
    implements SubscriptionsRemoteDataSource {
  SubscriptionRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<SubscriptionModel?>> getSubscriptionData() async {
    try {
      final response = await dio.post(
        ApiConstants.subscription,
        data: {
          "lang": UserHelper.getLanguage(),
        },
      );
      if (response.data['message'] == 'OK') {
        return SubscriptionModel.modelFromSnapShot(
            response.data['result']["subscriptions"]);
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      print(' *********  exception is ********** : $exception');
      rethrow;
    }
  }
}
