import 'package:flutter/material.dart';

/// {@template app_colors}
/// Colors class for themes which provides direct access with static fields.
/// {@endtemplate}
class AppColors {
  AppColors._();

  /// The color white
  static const white = Colors.white;

  /// The color black
  static const black = Colors.black;

  /// The color transparent
  static const transparent = Colors.transparent;

  /// brand color palette.
  static const brand = MaterialColor(
    0xFF17B26A,
    {
      50: Color(0xFFF6FEF9),
      100: Color(0xFFECFDF3),
      150: Color(0xFFDCFAE6),
      200: Color(0xFFA9EFC5),
      250: Color(0xFF75E0A7),
      300: Color(0xFF47CD89),
      400: Color(0xFF17B26A),
      500: Color(0xFF079455),
      600: Color(0xFF067647),
      700: Color(0xFF085D3A),
      800: Color(0xFF074D31),
      900: Color(0xFF053321),
    },
  );
