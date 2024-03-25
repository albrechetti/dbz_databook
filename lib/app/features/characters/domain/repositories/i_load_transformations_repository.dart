import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class ILoadTransformationsRepository {
  Future<Either<Exception, CharacterEntity>> loadTransformations(
      {required String? characterId});
}
