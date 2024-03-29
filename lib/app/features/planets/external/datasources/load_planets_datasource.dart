import 'package:dbz_databook/app/core/core.dart';
import 'package:dbz_databook/app/features/planets/infra/datasources/i_load_planets_datasource.dart';

class LoadPlanetsDatasource implements ILoadPlanetsDatasource {
  final IHttpService _httpService;

  LoadPlanetsDatasource({required IHttpService httpService})
      : _httpService = httpService;

  @override
  Future<List<Map<String, dynamic>>> call() async {
    final param = GetParam(url: ApiPaths.planets, params: {});
    final response = await _httpService.getAllPlanets(param);
    return response;
  }
}
