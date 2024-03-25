import 'package:dbz_databook/app/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import 'characters_event.dart';
import 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final ILoadCharactersUsecase _loadCharactersUsecase;
  List<CharacterEntity> allCharacters = [];

  CharactersBloc({required ILoadCharactersUsecase loadCharactersUsecase})
      : _loadCharactersUsecase = loadCharactersUsecase,
        super(LoadingCharactersState()) {
    on<LoadingCharactersEvent>(_loadingCharactersEvent);
  }
  //LoadingCharactersEvent
  _loadingCharactersEvent(LoadingCharactersEvent event, Emitter emitter) async {
    if (event.isLoading) {
      emitter(LoadingCharactersState());
    }
    final result = await _loadCharactersUsecase(const NoParam());
    result.fold((exception) {
      //ErrorLoadCharactersState
      emitter(
        ErrorLoadCharactersState(
          message: exception.toString(),
        ),
      );
    }, (characters) {
      // SuccessLoadCharactersState
      allCharacters = characters;
      emitter(
        SuccessLoadCharactersState(characters: characters),
      );
    });
  }
}
