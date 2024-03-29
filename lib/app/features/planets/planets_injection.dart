import 'package:dbz_databook/app/core/core.dart';

import 'planets.dart';

initPlanetsInjection() {
//datasource
  sl.registerSingleton<ILoadPlanetsDatasource>(
      LoadPlanetsDatasource(httpService: sl()));
//repository
  sl.registerSingleton<ILoadPlanetsRepository>(
      LoadPlanetsRepository(datasource: sl()));
//usecase
  sl.registerSingleton<ILoadPlanetsUsecase>(
      LoadPlanetsUsecase(repository: sl()));
//bloc
  sl.registerSingleton<PlanetsBloc>(PlanetsBloc(loadPlanetsUsecase: sl()));
}
