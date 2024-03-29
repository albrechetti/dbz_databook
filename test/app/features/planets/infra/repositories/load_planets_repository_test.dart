import 'package:dartz/dartz.dart';
import 'package:dbz_databook/app/features/planets/domain/repositories/i_load_planets_repository.dart';
import 'package:dbz_databook/app/features/planets/infra/datasources/i_load_planets_datasource.dart';
import 'package:dbz_databook/app/features/planets/infra/repositories/load_planets_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DatasourceMock extends Mock implements ILoadPlanetsDatasource {}

main() {
  late ILoadPlanetsRepository repository;
  late ILoadPlanetsDatasource datasource;

  setUp(() {
    datasource = DatasourceMock();
    repository = LoadPlanetsRepository(datasource: datasource);
  });

  test('should return a list of planets', () async {
    when(() => datasource()).thenAnswer((_) async => []);
    final result = await repository();

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List>());
  });

  test('should return an exception', () async {
    when(() => datasource()).thenThrow(Exception());
    final result = await repository();

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<Exception>());
  });
}
