import 'package:dbz_databook/app/core/core.dart';
import 'package:dbz_databook/app/features/characters/infra/datasource/i_load_transformations_datasource.dart';

class LoadTransformationsDatasource implements ILoadTransformationsDatasource {
  final IHttpService _httpService;

  LoadTransformationsDatasource({required IHttpService httpService})
      : _httpService = httpService;

  @override
  Future<Map<String, dynamic>> loadTransformations(
      {required String? characterId}) async {
    final getParam = GetParam(
      url: '${ApiPaths.characters}/$characterId',
      params: null,
    );

    final response = await _httpService.getCharactersTransformations(getParam);
    return response;
  }
}
