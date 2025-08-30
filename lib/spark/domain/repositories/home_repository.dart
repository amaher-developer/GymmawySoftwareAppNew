import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/home/home_entity.dart';


abstract class HomeRepository {
  Future<Either<Failure, HomeEntity>> getHomeData();
}
