import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  // TODO: Change repository to usecase in NotificationCubit

  final NotificationCubit repository;

  NotificationCubit({required this.repository})
      : super(InitialNotificationState());

  static NotificationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  updateState() {
    emit(UpdateState());
  }
}
