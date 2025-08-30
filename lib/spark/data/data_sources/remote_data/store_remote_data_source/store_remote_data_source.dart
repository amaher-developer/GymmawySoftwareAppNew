// Home data source

import 'package:zone/spark/data/models/store/store_model.dart';

import '../../../models/activty/activity_details_model.dart';

abstract class StoreRemoteDataSource {
  Future<List<StoresModel?>> getStoreProducts();
  Future<ActivityDetailsModel> storeDetails(String lang, int storeId);
}
