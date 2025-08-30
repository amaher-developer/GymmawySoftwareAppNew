import 'package:zone/core/error/failures.dart';
import 'package:zone/core/helper/user_helper.dart';
import 'package:zone/spark/presentation/cubit/login/login_cubit.dart';
import 'package:zone/spark/presentation/cubit/subscription_details/subscription_details_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/requests/subscription_reservation_request.dart';
import '../../../data/models/Single_message_response.dart';
import '../../../data/models/subscription/subscription_details_model.dart';
import '../../../domain/usecases/subscriptions_usecase/subscription_details_usecase.dart';

class SubscriptionDetailsCubit extends Cubit<SubscriptionDetailsStates> {
  final GetSubscriptionDetailsUseCase subscriptionDetailsUseCase;
  SubscriptionDetailsModel? subscriptionDetails = SubscriptionDetailsModel();
  SingleMessageResponse? reservedSubscription = SingleMessageResponse();

  SubscriptionDetailsCubit({required this.subscriptionDetailsUseCase})
      : super(InitialSubscriptionDetailsStates());

  static SubscriptionDetailsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getSubscriptionDetails(int id) async {
    emit(LoadingSubscriptionDetailsStates());
    final result = await subscriptionDetailsUseCase.getSubscriptionDetails(id);
    result.fold(
        (Failure failure) => emit(
              ErrorSubscriptionDetailsStates(failure.toError().message),
            ), (subscriptionDetails) {
      this.subscriptionDetails = subscriptionDetails;
      emit(
        SuccessSubscriptionDetailsStates(
            subscriptionDetails: subscriptionDetails),
      );
    });
  }

  // reserve subscription
  Future<void> reserveSubscription(int subscriptionId, LoginCubit cubit) async {
    emit(LoadingSubscriptionDetailsStates());
    final result = await subscriptionDetailsUseCase.reserveSubscription(
      SubscriptionReservationRequest(
        phone: cubit.state.user?.userPhone ??
            UserHelper.getGuestData()?.phone ??
            '',
        name:
            cubit.state.user?.userName ?? UserHelper.getGuestData()?.name ?? '',
        subscriptionId: subscriptionId.toString(),
      ),
    );
    result.fold(
        (Failure failure) => emit(
              ErrorSubscriptionDetailsStates(failure.toError().message),
            ), (reservedSubscription) {
      this.reservedSubscription = reservedSubscription;
      emit(
        SuccessSubscriptionReservingStates(
            reservedSubscription: reservedSubscription),
      );
    });
  }
}
