import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class ILoadCharactersRepository {
  Future<Either<Exception, List<CharacterEntity>>> loadCharacters();
}
