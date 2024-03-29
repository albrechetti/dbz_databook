import 'package:dbz_databook/app/core/core.dart';
import 'package:dbz_databook/app/features/planets/external/datasources/load_planets_datasource.dart';
import 'package:dbz_databook/app/features/planets/infra/datasources/i_load_planets_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ServiceMock extends Mock implements IHttpService {}

class ParamMock extends Fake implements GetParam {}

main() {
  late ILoadPlanetsDatasource datasource;
  late IHttpService httpServiceMock;

  setUp(() {
    httpServiceMock = ServiceMock();
    datasource = LoadPlanetsDatasource(httpService: httpServiceMock);
  });

  setUpAll(() {
    registerFallbackValue(ParamMock());
  });

  test('should return a list of planets', () async {
    when(() => httpServiceMock.getAllPlanets(any()))
        .thenAnswer((_) async => []);
    final result = await datasource();

    expect(result, isA<List<Map<String, dynamic>>>());
  });

  test('should return an exception', () async {
    when(() => httpServiceMock.getAllPlanets(any())).thenThrow(Exception());
    final result = await datasource();

    expect(result, isA<Exception>());
  });
}
