import 'package:zone/spark/domain/repositories/shared_repoistory.dart';
import 'package:zone/spark/presentation/cubit/shared/shared_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../core/helper/user_helper.dart';

class SharedCubit extends Cubit<SharedState> {
  final SharedRepository sharedRepository;

  SharedCubit({required this.sharedRepository}) : super(InitialSharedState());

  static SharedCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> changlang(context, String code) async {
    await UserHelper.setLanguage(languageCode: code);
    changeLocale(context, code);
  }

  void initLang(context) async {
    if (UserHelper.getUserToken() == null &&
        UserHelper.getIsFirstTime() == false) {
      await UserHelper.setLanguage(languageCode: 'ar');
      changeLocale(context, 'ar');
    }
  }
}
