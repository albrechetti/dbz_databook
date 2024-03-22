import '../../../core/services/services.dart';
import '../infra/infra.dart';

class LoadCharactersDatasource implements ILoadCharactersDatasource {
  final IHttpService _httpService;

  LoadCharactersDatasource({required IHttpService httpService})
      : _httpService = httpService;

  @override
  Future<List<Map<String, dynamic>>> loadCharacters() async {
    final getParam = GetParam(url: ApiPaths.characters, params: {});

    final response = await _httpService.getAllCharacters(getParam);
    return response;
  }
}
