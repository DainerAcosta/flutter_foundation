import 'package:flutter/material.dart';

class FlutterAppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 39, 255, 19),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
        accentColor: const Color.fromARGB(255, 129, 19, 255),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: const Color(0xFF13B9FF),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xFF13B9FF),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: const Color(0xFF13B9FF),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: const Color(0xFF13B9FF),
    );
  }
}
