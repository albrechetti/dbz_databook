import 'package:dartz/dartz.dart';

import '../../domain/domain.dart';
import '../infra.dart';

class LoadCharactersRepository implements ILoadCharactersRepository {
  final ILoadCharactersDatasource _datasource;
  LoadCharactersRepository({required ILoadCharactersDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<Exception, List<CharacterEntity>>> loadCharacters() async {
    try {
      final response = await _datasource.loadCharacters();
      final characters = response
          .map((character) => CharacterMapper.fromMap(character))
          .toList();
      return Right(characters);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
