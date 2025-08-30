// Home data source

import 'package:zone/spark/data/models/traks/traks.dart';

abstract class TracksRemoteDataSource {
  Future<List<TrackModel?>> getTracks();
}
