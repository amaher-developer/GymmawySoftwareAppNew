import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/login/login_screen.dart';
import 'states.dart';

class MainLayoutCubit extends Cubit<MainLayoutStates> {
  Widget currentWidget = LoginScreen();
  int currentIndex = 0;
  final PageController pageController = PageController();

  MainLayoutCubit() : super(InitialMainLayoutStates());

  static MainLayoutCubit get(context) => BlocProvider.of(context);

  changeDrawer({required Widget widget}) {
    emit(LoadingMainLayoutStates());
    currentWidget = widget;
    emit(SuccessMainLayoutStates());
  }

  changeIndex({required int index}) {
    currentIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    emit(SuccessMainLayoutStates());
  }
}
