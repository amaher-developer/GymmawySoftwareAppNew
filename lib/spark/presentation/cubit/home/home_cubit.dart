import 'package:zone/core/error/failures.dart';
import 'package:zone/spark/domain/repositories/home_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../domain/entities/home/home_entity.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepository repository;
  HomeEntity? homeEntity;

  HomeCubit({required this.repository}) : super(InitialHomeState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getHomeData() async {
    emit(
      LoadingHomeState(),
    );
    final result = await repository.getHomeData();
    result.fold(
      (Failure failure) => emit(
        ErrorHomeState(failure.toError().message),
      ),
      (homeEntity) {
        this.homeEntity = homeEntity;
        emit(
          SuccessHomeState(
            homeEntity: homeEntity,
          ),
        );
      },
    );
  }

  updateState() {
    emit(const UpdateState());
  }

  void changeHomeNotificationState() {
    homeEntity?.isNewNotifications = 0;
    emit(
      const UpdateState(),
    );
  }

  void initPermission() async {
    if (await Permission.notification.request().isDenied) {}
  }
}
