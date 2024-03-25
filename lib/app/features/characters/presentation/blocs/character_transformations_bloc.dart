import 'package:flutter_bloc/flutter_bloc.dart';

import '../../characters.dart';

class CharacterTransformationsBloc
    extends Bloc<CharacterTransformationsEvent, CharacterTransformationsState> {
  final ILoadTransformationsUsecase _loadTransformationsUsecase;
  final List<TransformationEntity> characterTransformations = [];

  CharacterTransformationsBloc(
      {required ILoadTransformationsUsecase loadTransformationsUsecase})
      : _loadTransformationsUsecase = loadTransformationsUsecase,
        super(LoadingCharacterTransformationsState()) {
    on<LoadingCharacterTransformationsEvent>(
        _loadingCharacterTransformationsEvent);
  }

  _loadingCharacterTransformationsEvent(
      LoadingCharacterTransformationsEvent, Emitter emitter) async {
    if (LoadingCharacterTransformationsEvent.isLoading) {}

    final result = await _loadTransformationsUsecase(
        LoadingCharacterTransformationsEvent.characterID);
    result.fold((exception) {
      emitter(
        ErrorLoadCharacterTransformationsState(
          message: exception.toString(),
        ),
      );
    }, (character) {
      emitter(
        SuccessLoadCharacterTransformationsState(
          characterTransformations: character.transformations ?? [],
        ),
      );
    });
  }
}
