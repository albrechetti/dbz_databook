import 'package:dartz/dartz.dart';
import 'package:dbz_databook/app/core/commons/commons.dart';
import 'package:dbz_databook/app/features/planets/domain/repositories/i_load_planets_repository.dart';

import '../entities/planet_entity.dart';

abstract class ILoadPlanetsUsecase
    implements IFutureUsecase<NoParam, List<PlanetEntity>> {}

class LoadPlanetsUsecase implements ILoadPlanetsUsecase {
  final ILoadPlanetsRepository _repository;

  LoadPlanetsUsecase({required ILoadPlanetsRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, List<PlanetEntity>>> call(NoParam params) async {
    return await _repository();
  }
}
