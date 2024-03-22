import 'package:dbz_databook/app/core/services/services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initDioInjections();
}

Future<void> initDioInjections() async {
  sl.registerFactory(() => Dio());
  sl.registerSingleton<IHttpService>(
    HttpService(
      dio: sl.get(),
    ),
  );
}
