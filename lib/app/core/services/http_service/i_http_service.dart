abstract class IHttpService {
  Future<List<Map<String, dynamic>>> getAllCharacters(GetParam param);
  Future<Map<String, dynamic>> getCharactersTransformations(GetParam param);
}

class GetParam {
  final String url;
  final Map<String, dynamic>? params;

  GetParam({required this.url, required this.params});
}
