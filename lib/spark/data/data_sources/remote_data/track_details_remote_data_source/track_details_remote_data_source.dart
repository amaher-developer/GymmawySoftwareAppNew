// Home data source

import '../../../models/trak_details/trak_details.dart';

abstract class TrackDetailsRemoteDataSource {
  Future<TrackDetailsModel?> getTrackDetails({required int id});
}
