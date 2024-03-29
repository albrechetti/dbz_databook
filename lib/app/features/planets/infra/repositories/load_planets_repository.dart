import 'package:dartz/dartz.dart';
import 'package:dbz_databook/app/features/planets/domain/entities/planet_entity.dart';
import 'package:dbz_databook/app/features/planets/domain/repositories/i_load_planets_repository.dart';
import 'package:dbz_databook/app/features/planets/infra/datasources/i_load_planets_datasource.dart';
import 'package:dbz_databook/app/features/planets/infra/mappers/planet_mapper.dart';

class LoadPlanetsRepository implements ILoadPlanetsRepository {
  final ILoadPlanetsDatasource _datasource;

  LoadPlanetsRepository({required ILoadPlanetsDatasource datasource})
      : _datasource = datasource;
  @override
  Future<Either<Exception, List<PlanetEntity>>> call() async {
    try {
      final response = await _datasource();
      final planets = response.map(PlanetMapper.fromMap).toList();
      return Right(planets);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
