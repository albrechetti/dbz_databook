import 'package:dartz/dartz.dart';
import 'package:dbz_databook/app/core/core.dart';
import 'package:dbz_databook/app/features/planets/domain/repositories/i_load_planets_repository.dart';
import 'package:dbz_databook/app/features/planets/domain/usecases/load_planets_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements ILoadPlanetsRepository {}

class ParamMock extends Fake implements NoParam {}

main() {
  late ILoadPlanetsUsecase usecase;
  late ILoadPlanetsRepository repository;

  setUp(() {
    repository = RepositoryMock();
    usecase = LoadPlanetsUsecase(repository: repository);
  });

  setUpAll(() {
    registerFallbackValue(ParamMock());
  });

  test('should return a list of planets', () async {
    when(() => repository()).thenAnswer((_) async => const Right([]));

    final result = await usecase(ParamMock());

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List>());
  });

  test('should return an exception', () async {
    when(() => repository()).thenAnswer((_) async => Left(Exception()));

    final result = await usecase(ParamMock());

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<Exception>());
  });
}
