import 'package:flutter/material.dart';

/// {@template app_shadow}
/// Shadow class contains all shadows used in app
/// {@endtemplate}
class AppShadow {
  AppShadow._();

  /// Extra small shadow.
  static const xs = [
    BoxShadow(
      blurRadius: 2,
      offset: Offset(0, 1),
      color: Color.fromRGBO(16, 24, 40, 0.05),
    ),
  ];

  /// Small shadow.
  static const sm = [
    BoxShadow(
      color: Color(0x0F101828),
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Color(0x19101828),
      blurRadius: 3,
      offset: Offset(0, 1),
    ),
  ];

  /// Medium shadow.
  static const md = [
    BoxShadow(
      color: Color(0x0F101828),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: -2,
    ),
    BoxShadow(
      color: Color(0x19101828),
      blurRadius: 8,
      offset: Offset(0, 4),
      spreadRadius: -2,
    ),
  ];

  /// Large shadow.
  static const lg = [
    BoxShadow(
      color: Color(0x07101828),
      blurRadius: 6,
      offset: Offset(0, 4),
      spreadRadius: -2,
    ),
    BoxShadow(
      color: Color(0x14101828),
      blurRadius: 16,
      offset: Offset(0, 12),
      spreadRadius: -4,
    ),
  ];

  /// Extra large shadow.
  static const xl = [
    BoxShadow(
      color: Color(0x07101828),
      blurRadius: 8,
      offset: Offset(0, 8),
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0x14101828),
      blurRadius: 24,
      offset: Offset(0, 20),
      spreadRadius: -4,
    ),
  ];

  /// 2x extra large shadow.
  static const xl2 = [
    BoxShadow(
      color: Color(0x2D0F1728),
      blurRadius: 48,
      offset: Offset(0, 24),
      spreadRadius: -12,
    ),
  ];

  /// 3x extra large shadow.
  static const xl3 = [
    BoxShadow(
      color: Color(0x230F1728),
      blurRadius: 64,
      offset: Offset(0, 32),
      spreadRadius: -12,
    ),
  ];
}
