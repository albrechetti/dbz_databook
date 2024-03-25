import '../../core/core.dart';
import 'characters.dart';

initCharactersInjection() {
  // DataSource
  sl.registerSingleton<ILoadCharactersDatasource>(
    LoadCharactersDatasource(httpService: sl.get()),
  );

  sl.registerSingleton<ILoadTransformationsDatasource>(
    LoadTransformationsDatasource(httpService: sl.get()),
  );
  // Repository
  sl.registerSingleton<ILoadCharactersRepository>(
    LoadCharactersRepository(datasource: sl.get()),
  );

  sl.registerSingleton<ILoadTransformationsRepository>(
    LoadTransformationsRepository(datasource: sl.get()),
  );
  // Usecase
  sl.registerSingleton<ILoadCharactersUsecase>(
    LoadCharactersUsecase(repository: sl.get()),
  );

  sl.registerSingleton<ILoadTransformationsUsecase>(
    LoadTransformationsUsecase(repository: sl.get()),
  );
  // Bloc
  sl.registerSingleton<CharactersBloc>(
    CharactersBloc(loadCharactersUsecase: sl.get()),
  );

  sl.registerSingleton<CharacterTransformationsBloc>(
    CharacterTransformationsBloc(loadTransformationsUsecase: sl.get()),
  );
}
