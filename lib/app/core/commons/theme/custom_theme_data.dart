import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData get themeData => ThemeData(
        textTheme: textTheme,
        primaryColor: colorScheme.primary,
        scaffoldBackgroundColor: colorScheme.background,
        colorScheme: colorScheme.copyWith(secondary: colorScheme.secondary),
      );

  static const textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      fontFamily: 'Roboto',
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      fontFamily: 'Roboto',
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      fontFamily: 'Roboto',
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
  );

  static const colorScheme = ColorScheme(
    primary: Color(0xFFF37317),
    secondary: Color(0xffEEE8D8),
    surface: Color(0xff2A231C),
    background: Color(0xFF192E46),
    error: Colors.red,
    onPrimary: Color(0xFF192E46),
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  // Gradients colors
  static const orangeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF37317),
      Color(0xFFF37317),
      Color(0xFFF39E3D),
    ],
  );

  static const darkGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF192E46),
      Color(0xFF000000),
      Color(0xFF000000),
    ],
  );

  static const bottomBarGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF3D71AC),
      Color(0xFF192E46),
    ],
  );
}
