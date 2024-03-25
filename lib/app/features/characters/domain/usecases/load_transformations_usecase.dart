import 'package:dartz/dartz.dart';
import 'package:dbz_databook/app/core/core.dart';

import '../../characters.dart';

abstract class ILoadTransformationsUsecase
    implements IFutureUsecase<String?, CharacterEntity> {}

class LoadTransformationsUsecase implements ILoadTransformationsUsecase {
  final ILoadTransformationsRepository _repository;

  LoadTransformationsUsecase(
      {required ILoadTransformationsRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, CharacterEntity>> call(String? params) async {
    return await _repository.loadTransformations(characterId: params);
  }
}
