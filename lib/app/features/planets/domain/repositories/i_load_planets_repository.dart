import 'package:dartz/dartz.dart';

import '../entities/planet_entity.dart';

abstract class ILoadPlanetsRepository {
  Future<Either<Exception, List<PlanetEntity>>> call();
}
