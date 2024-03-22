abstract class CharactersEvent {
  const CharactersEvent();
}

class LoadingCharactersEvent extends CharactersEvent {
  final bool isLoading;
  LoadingCharactersEvent({required this.isLoading});
}
