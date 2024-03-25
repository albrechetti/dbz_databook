abstract class CharactersEvent {
  const CharactersEvent();
}

class LoadingCharactersEvent extends CharactersEvent {
  final bool isLoading;
  final String? characterID;
  LoadingCharactersEvent({required this.isLoading, required this.characterID});
}
