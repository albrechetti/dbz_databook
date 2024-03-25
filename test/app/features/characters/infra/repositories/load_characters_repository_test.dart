import 'package:dbz_databook/app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/characters_mock.dart';

class DatasourceMock extends Mock implements ILoadCharactersDatasource {}

main() {
  late ILoadCharactersRepository repository;
  late ILoadCharactersDatasource datasource;

  setUp(() {
    datasource = DatasourceMock();
    repository = LoadCharactersRepository(datasource: datasource);
  });

  test('Should Return a List of CharacterEntity ', () async {
    when(() => datasource.loadCharacters())
        .thenAnswer((_) async => charactersListMapMock);
    final response = await repository.loadCharacters();
    final result = response.fold((l) => l, (r) => r);
    expect(result, isA<List<CharacterEntity>>());
  });

  test('Should Return a Exception ', () async {
    when(() => datasource.loadCharacters()).thenThrow(Exception());
    final response = await repository.loadCharacters();
    final result = response.fold((l) => l, (r) => r);
    expect(result, isA<Exception>());
  });
}
