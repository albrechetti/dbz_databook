abstract class CharacterTransformationsEvent {
  const CharacterTransformationsEvent();
}

class LoadingCharacterTransformationsEvent
    extends CharacterTransformationsEvent {
  final bool isLoading;
  final String characterID;

  LoadingCharacterTransformationsEvent({
    required this.isLoading,
    required this.characterID,
  });
}
