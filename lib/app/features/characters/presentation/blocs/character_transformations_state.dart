import '../../domain/domain.dart';

abstract class CharacterTransformationsState {
  const CharacterTransformationsState();
}

class LoadingCharacterTransformationsState
    extends CharacterTransformationsState {}

class SuccessLoadCharacterTransformationsState
    extends CharacterTransformationsState {
  final List<TransformationEntity> characterTransformations;
  SuccessLoadCharacterTransformationsState(
      {required this.characterTransformations});
}

class ErrorLoadCharacterTransformationsState
    extends CharacterTransformationsState {
  final String message;
  ErrorLoadCharacterTransformationsState({required this.message});
}
