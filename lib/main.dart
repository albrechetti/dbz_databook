import 'package:dbz_databook/app/features/characters/characters.dart';
import 'package:flutter/material.dart';
import 'app/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  await initCharactersInjection();
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
