import 'package:dartz/dartz.dart';
import 'package:dbz_databook/app/features/characters/characters.dart';

import '../../domain/repositories/i_load_transformations_repository.dart';
import '../datasource/i_load_transformations_datasource.dart';

class LoadTransformationsRepository implements ILoadTransformationsRepository {
  final ILoadTransformationsDatasource _datasource;

  LoadTransformationsRepository(
      {required ILoadTransformationsDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<Exception, CharacterEntity>> loadTransformations(
      {required String? characterId}) async {
    try {
      final result =
          await _datasource.loadTransformations(characterId: characterId);

      final character = CharacterMapper.fromMap(result);
      return Right(character);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
