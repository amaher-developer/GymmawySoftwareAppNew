import 'package:zone/spark/data/models/store/store_model.dart';
import 'package:equatable/equatable.dart';

abstract class StoreStates extends Equatable {
  const StoreStates();
}

class InitialStoreStates extends StoreStates {
  @override
  List<Object?> get props => [];
}

class LoadingStoreStates extends StoreStates {
  @override
  List<Object?> get props => [];
}

class ReloadingStoreStates extends StoreStates {
  @override
  List<Object?> get props => [];
}

class SuccessStoreStates extends StoreStates {
  const SuccessStoreStates({required this.storeProductsList});

  final List<StoresModel?> storeProductsList;

  @override
  List<Object?> get props => [storeProductsList];
}

class UpdateState extends StoreStates {
  @override
  List<Object?> get props => [];
}

class ErrorStoreStates extends StoreStates {
  final String error;

  const ErrorStoreStates(this.error);

  @override
  List<Object?> get props => [error];
}
