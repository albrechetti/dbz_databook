import 'package:flutter/material.dart';
import 'app/core/core.dart';
import 'app/features/features.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  await initCharactersInjection();
  await initPlanetsInjection();
  return runApp(
    MaterialApp(
      title: 'DBZ Databook',
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.themeData,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    ),
  );
}
