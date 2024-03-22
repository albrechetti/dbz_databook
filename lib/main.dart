import 'package:dbz_databook/app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'app/core/utils/app_injections.dart';
import 'app/features/characters/characteres_injection.dart';
import 'app/features/characters/presentation/pages/characters/characters_page.dart';
import 'app/features/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  await initCharactersInjection();
  return runApp(
    MaterialApp(
      title: 'DBZ Databook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/characters': (context) => const CharactersPage(),
      },
    ),
  );
}
