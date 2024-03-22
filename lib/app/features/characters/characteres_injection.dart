import 'package:dbz_databook/app/core/utils/app_injections.dart';
import 'package:dbz_databook/app/features/characters/infra/infra.dart';

import 'datasource/datasource.dart';
import 'domain/domain.dart';
import 'presentation/blocs/characters/characters_bloc.dart';

initCharactersInjection() {
  // DataSource
  sl.registerSingleton<ILoadCharactersDatasource>(
    LoadCharactersDatasource(
      httpService: sl.get(),
    ),
  );
  // Repository
  sl.registerSingleton<ILoadCharactersRepository>(
    LoadCharactersRepository(
      datasource: sl.get(),
    ),
  );
  // Usecase
  sl.registerSingleton<ILoadCharactersUsecase>(
    LoadCharactersUsecase(
      repository: sl.get(),
    ),
  );
  // Bloc
  sl.registerSingleton<CharactersBloc>(
    CharactersBloc(
      loadCharactersUsecase: sl.get(),
    ),
  );
}
