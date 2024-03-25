import 'package:dartz/dartz.dart';
import 'package:dbz_databook/app/core/commons/commons.dart';
import 'package:dbz_databook/app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/characters_mock.dart';

class RepositoryMock extends Mock implements ILoadCharactersRepository {}

class Param extends Fake implements NoParam {}

main() {
  late ILoadCharactersUsecase usecase;
  late ILoadCharactersRepository repository;

  setUp(() {
    repository = RepositoryMock();
    usecase = LoadCharactersUsecase(repository: repository);
  });

  setUpAll(() {
    registerFallbackValue(Param());
  });

  test('should return a list of characters', () async {
    when(() => repository.loadCharacters())
        .thenAnswer((_) async => Right(charactersListMock));
    final response = await usecase(Param());
    final result = response.fold((l) => l, (r) => r);
    expect(result, isA<List<CharacterEntity>>());
  });

  test('should return a exception', () async {
    when(() => repository.loadCharacters())
        .thenAnswer((_) async => Left(Exception()));
    final response = await usecase(Param());
    final result = response.fold((l) => l, (r) => r);
    expect(result, isA<Exception>());
  });

  test('should return Goku ', () async {
    when(() => repository.loadCharacters())
        .thenAnswer((_) async => Right(charactersListMock));
    final response = await usecase(Param());
    String characterName = '';
    final result = response.fold((l) => l, (r) {
      characterName = r.first.name;
      return r;
    });

    expect(result, isA<List<CharacterEntity>>());
    expect(characterName, 'Goku');
  });
}
