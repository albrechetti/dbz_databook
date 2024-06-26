import 'package:dio/dio.dart';
import '../../core.dart';

class HttpService implements IHttpService {
  final Dio _dio;
  HttpService({required Dio dio}) : _dio = dio {
    _dio.interceptors.add(ApiInterceptor());
    _dio.options.baseUrl = ApiPaths.baseURL;
  }

  @override
  Future<List<Map<String, dynamic>>> getAllCharacters(GetParam param) async {
    try {
      final response = await _dio.get(
        param.url,
        queryParameters: param.params,
      );
      AppLogger.important.i('Data: ${response.data}');
      final list = response.data['items'];
      final items = List<Map<String, dynamic>>.from(list);
      return items;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getCharactersTransformations(
      GetParam param) async {
    try {
      final response = await _dio.get(
        param.url,
        queryParameters: param.params,
      );
      AppLogger.important.i('Data: ${response.data}');
      final character = response.data;
      return character;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAllPlanets(GetParam param) async {
    try {
      final response = await _dio.get(
        param.url,
        queryParameters: param.params,
      );
      AppLogger.important.i('Data: ${response.data}');
      final list = response.data['items'];
      final items = List<Map<String, dynamic>>.from(list);
      return items;
    } on Exception {
      rethrow;
    }
  }
}
