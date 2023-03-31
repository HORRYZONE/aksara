import 'package:flutter/material.dart';

class AksaraTheme {
  final ColorScheme? colorScheme;

  AksaraTheme(this.colorScheme);

  ColorScheme _baseScheme(Brightness brightness) {
    return ColorScheme.fromSeed(seedColor: const Color(0xFFb9c57d), brightness: brightness);
  }

  ThemeData darkMode() {
    return ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme:
            colorScheme ?? _baseScheme(Brightness.dark),
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Inter'));
  }

  ThemeData lightMode() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme ?? _baseScheme(Brightness.dark),
        fontFamily: 'Inter');
  }
}
