import 'package:flutter/material.dart';
import '../../../features/features.dart';

class AppRoutes {
  static const splash = '/splash';
  static const home = '/home';
  static const characters = '/characters';
  static const characterProfile = '/character-profile';

  static const initialRoute = splash;

  static get routes => {
        AppRoutes.splash: (context) => const SplashPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.characters: (context) => const CharactersListPage(),
        AppRoutes.characterProfile: (context) => CharacterProfilePage(
              character:
                  ModalRoute.of(context)!.settings.arguments as CharacterEntity,
            ),
      };
}
