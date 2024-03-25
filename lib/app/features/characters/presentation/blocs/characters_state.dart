import '../../domain/domain.dart';

abstract class CharactersState {
  const CharactersState();
}

class LoadingCharactersState extends CharactersState {}

class SuccessLoadCharactersState extends CharactersState {
  final List<CharacterEntity> characters;
  SuccessLoadCharactersState({required this.characters});
}

class ErrorLoadCharactersState extends CharactersState {
  final String message;
  ErrorLoadCharactersState({required this.message});
}
