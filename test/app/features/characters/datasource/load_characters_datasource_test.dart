import 'package:dbz_databook/app/core/core.dart';
import 'package:dbz_databook/app/features/characters/characters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/characters_mock.dart';

class ServiceMock extends Mock implements IHttpService {}

class Param extends Fake implements GetParam {}

main() {
  late ILoadCharactersDatasource datasource;
  late IHttpService httpServiceMock;

  setUp(() {
    httpServiceMock = ServiceMock();
    datasource = LoadCharactersDatasource(httpService: httpServiceMock);
  });

  setUpAll(() {
    registerFallbackValue(Param());
  });

  test('Should Return a List of Map<String, dynamic> ', () async {
    when(() => httpServiceMock.getAllCharacters(any()))
        .thenAnswer((_) async => charactersListMapMock);
    final response = await datasource.loadCharacters();
    expect(response, isA<List<Map<String, dynamic>>>());
  });

  test('Should Return a Exception ', () async {
    when(() => httpServiceMock.getAllCharacters(any())).thenThrow(Exception());
    final response = datasource.loadCharacters();
    expect(() => response, throwsException);
  });
}
