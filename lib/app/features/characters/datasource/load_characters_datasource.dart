import '../../../core/services/services.dart';
import '../infra/infra.dart';

class LoadCharactersDatasource implements ILoadCharactersDatasource {
  final IHttpService _httpService;

  LoadCharactersDatasource({required IHttpService httpService})
      : _httpService = httpService;

  @override
  Future<List<Map<String, dynamic>>> loadCharacters(
      {String? characterID}) async {
    final getParam = GetParam(
        url: '${ApiPaths.characters}/${characterID ?? ''}', params: {});

    final response = await _httpService.getAllCharacters(getParam);
    return response;
  }
}
