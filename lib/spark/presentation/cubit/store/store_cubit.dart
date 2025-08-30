import 'package:zone/spark/data/models/store/store_model.dart';
import 'package:zone/spark/domain/usecases/store_usecase/store_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'store_state.dart';

class StoreCubit extends Cubit<StoreStates> {
  final StoreUseCase storeUseCase;
  List<StoresModel?> storeProductsList = [];

  StoreCubit({required this.storeUseCase}) : super(InitialStoreStates());

  static StoreCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getStoreProducts() async {
    emit(LoadingStoreStates());
    final result = await storeUseCase.getStoreProducts();
    result.fold(
      (failure) => emit(ErrorStoreStates(failure.toError().message)),
      (storeProducts) {
        storeProductsList = storeProducts;
        emit(SuccessStoreStates(storeProductsList: storeProducts));
      },
    );
  }

  updateState() {
    emit(UpdateState());
  }
}
