abstract class ILoadTransformationsDatasource {
  Future<Map<String, dynamic>> loadTransformations(
      {required String? characterId});
}
