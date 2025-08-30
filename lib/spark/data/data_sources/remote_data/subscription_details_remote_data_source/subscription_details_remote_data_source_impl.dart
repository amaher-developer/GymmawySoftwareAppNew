// Home data source

import 'package:zone/spark/data/models/subscription/subscription_details_model.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/helper/user_helper.dart';
import '../../../../../core/network/api_constants.dart';
import '../../../../../core/network/requests/subscription_reservation_request.dart';
import '../../../../../core/utils/utils.dart';
import '../../../models/Single_message_response.dart';
import '../../../models/guest.dart';
import 'subscription_details_remote_data_source.dart';

class SubscriptionDetailsRemoteDataSourceImpl
    implements SubscriptionDetailsRemoteDataSource {
  SubscriptionDetailsRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;
  @override
  Future<SubscriptionDetailsModel?> getSubscriptionDetails(int id) async {
    try {
      final response = await dio.post(
        ApiConstants.subscriptionDetails.replaceAll('{id}', id.toString()),
        data: {
          "lang": UserHelper.getLanguage(),
        },
      );
      if (response.data['message'] == 'OK') {
        return SubscriptionDetailsModel.fromJson(
            response.data['result']["subscription"]);
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      print(' *********  exception is ********** : $exception');
      rethrow;
    }
  }

  @override
  Future<SingleMessageResponse> reserveSubscription(
      SubscriptionReservationRequest request) async {
    GuestPhoneAndNameModel? guestData;
    if (UserHelper.getGuestData() != null) {
      guestData = UserHelper.getGuestData();
    }
    try {
      final response = await dio.post(
        ApiConstants.subscriptionReservation
            .replaceAll('{id}', request.subscriptionId),
        options: Options(
          headers: {
            if (UserHelper.getUserToken() != null)
              'Authorization': 'Bearer ${UserHelper.getUserToken()}',
          },
        ),
        data: {
          "lang": UserHelper.getLanguage(),
          "phone": guestData?.phone ?? request.phone,
          "name": guestData?.name ?? request.name,
        },
      );
      if (response.data['success'] == true) {
        showToast(
          content: response.data['message'],
          status: NotificationStatus.success,
          length: Toast.LENGTH_SHORT,
        );
        return SingleMessageResponse.fromJson(response.data);
      } else {
        throw CustomException.unKnownException(response.data['message']);
      }
    } catch (exception) {
      print(' *********  exception is ********** : $exception');
      rethrow;
    }
  }
}
