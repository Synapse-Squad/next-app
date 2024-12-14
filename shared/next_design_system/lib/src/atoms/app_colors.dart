import 'package:flutter/material.dart';

/// {@template app_colors}
/// Colors class for themes which provides direct access with static fields.
/// {@endtemplate}
class AppColors {
  AppColors._();

  /// The color white
  static const white = Colors.white;

  /// The color black
  static const black = Color(0xFF14171A);

  /// The color transparent
  static const transparent = Colors.transparent;

  /// The color dark gray
  static const darkGray = Color(0xFF657786);

  /// The color light gray
  static const lightGray = Color(0xFFAAB8C2);

  /// The color extra-light gray
  static const extraLightGray = Color(0xFFE1E8ED);

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

      /// default color
      400: Color(0xFF17B26A),
      500: Color(0xFF079455),
      600: Color(0xFF067647),
      700: Color(0xFF085D3A),
      800: Color(0xFF074D31),
      900: Color(0xFF053321),
    },
  );

  /// Error color palette.
  static const error = MaterialColor(
    0xFFF04438,
    {
      50: Color(0xFFFFFBFA),
      100: Color(0xFFFEF3F2),
      150: Color(0xFFFEE4E2),
      200: Color(0xFFFECDCA),
      250: Color(0xFFFDA29B),
      300: Color(0xFFF97066),
      400: Color(0xFFF04438),
      500: Color(0xFFD92D20),
      600: Color(0xFFB42318),
      700: Color(0xFF912018),
      800: Color(0xFF7A271A),
      900: Color(0xFF55160C),
    },
  );
}
