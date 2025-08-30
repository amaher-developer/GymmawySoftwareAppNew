// Home data source
import '../../../models/home.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHomeData();
}
