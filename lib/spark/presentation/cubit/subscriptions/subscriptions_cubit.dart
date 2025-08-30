import 'package:zone/spark/domain/usecases/subscriptions_usecase/subscription_usecase.dart';
import 'package:zone/spark/presentation/cubit/subscriptions/subscriptions_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionsCubit extends Cubit<SubscriptionsStates> {
  final GetSubscriptionsUseCase subscriptionsUseCase;

  SubscriptionsCubit({required this.subscriptionsUseCase})
      : super(InitialSubscriptionsStates());

  static SubscriptionsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getSubscriptions() async {
    emit(
      LoadingSubscriptionsStates(),
    );
    final result = await subscriptionsUseCase.getSubscriptions();
    result.fold(
      (failure) {
        emit(
          ErrorSubscriptionsStates(
            failure.toError().message,
          ),
        );
      },
      (subscriptions) {
        emit(
          SuccessSubscriptionsStates(
            subscriptions: subscriptions,
          ),
        );
      },
    );
  }
}
