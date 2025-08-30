part of 'store_details_cubit.dart';

abstract class StoreDetailsState extends Equatable {
  const StoreDetailsState();
}

class StoreDetailsInitial extends StoreDetailsState {
  @override
  List<Object> get props => [];
}

class StoreDetailsLoadingState extends StoreDetailsState {
  @override
  List<Object?> get props => [];
}

class StoreDetailsErrorState extends StoreDetailsState {
  final String message;

  const StoreDetailsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class StoreDetailsSuccessState extends StoreDetailsState {
  final ActivityDetailsEntity storeDetails;
  const StoreDetailsSuccessState({
    required this.storeDetails,
  });

  @override
  List<Object?> get props => [storeDetails];
}
