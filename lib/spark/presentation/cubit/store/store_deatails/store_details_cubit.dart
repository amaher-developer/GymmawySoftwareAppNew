import 'package:bloc/bloc.dart';
import 'package:zone/core/network/api_constants.dart';
import 'package:zone/spark/domain/entities/activity/activity_details_enrtity.dart';
import 'package:zone/spark/domain/usecases/store_usecase/get_store_details_use_case.dart';
import 'package:equatable/equatable.dart';
part 'store_details_state.dart';

class StoreDetailsCubit extends Cubit<StoreDetailsState> {
  final GetStoreDetailsUseCase getStoreDetailsUseCase;

  StoreDetailsCubit({required this.getStoreDetailsUseCase})
      : super(StoreDetailsInitial());

  Future<void> getStoreDetails(int storeId) async {
    emit(StoreDetailsLoadingState());
    final result = await getStoreDetailsUseCase(ApiConstants.arLang, storeId);

    result.fold(
      (failure) {
        emit(StoreDetailsErrorState(
          message: failure.toError().message,
        ));
      },
      (storeDetails) async {
        emit(
          StoreDetailsSuccessState(
            storeDetails: storeDetails,
          ),
        );
      },
    );
  }
}
