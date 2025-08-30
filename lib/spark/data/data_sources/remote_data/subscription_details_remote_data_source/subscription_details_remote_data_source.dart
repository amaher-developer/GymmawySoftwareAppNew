// Home data source
import '../../../../../core/network/requests/subscription_reservation_request.dart';
import '../../../models/Single_message_response.dart';
import '../../../models/subscription/subscription_details_model.dart';

abstract class SubscriptionDetailsRemoteDataSource {
  Future<SubscriptionDetailsModel?> getSubscriptionDetails(int id);

  // reserving subscription
  Future<SingleMessageResponse> reserveSubscription(
      SubscriptionReservationRequest request);
}
