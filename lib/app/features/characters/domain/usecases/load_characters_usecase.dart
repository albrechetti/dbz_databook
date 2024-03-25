import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

abstract class ILoadCharactersUsecase
    implements IFutureUsecase<NoParam, List<CharacterEntity>> {}

class LoadCharactersUsecase implements ILoadCharactersUsecase {
  final ILoadCharactersRepository _repository;

  LoadCharactersUsecase({required ILoadCharactersRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, List<CharacterEntity>>> call(NoParam parm) async {
    return await _repository.loadCharacters();
  }
}
