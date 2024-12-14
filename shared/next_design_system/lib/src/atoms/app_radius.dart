import 'package:flutter/material.dart';

/// {@template app_radius}
/// Radius class contains all radius used in app
/// {@endtemplate}
class AppRadius {
  AppRadius._();

  /// Radius of 0.
  static const none = Radius.zero;

  /// Extra extra small radius of 2.
  static const xxs = Radius.circular(2);

  /// Extra small radius of 4.
  static const xs = Radius.circular(4);

  /// Small radius of 6.
  static const sm = Radius.circular(6);

  /// Medium radius of 8.
  static const md = Radius.circular(8);

  /// Large radius of 10.
  static const lg = Radius.circular(10);

  /// Extra large radius of 12.
  static const xl = Radius.circular(12);

  /// 2x extra large radius of 16.
  static const xl2 = Radius.circular(16);

  /// 3x extra large radius of 20.
  static const xl3 = Radius.circular(20);

  /// 4x extra large radius of 24.
  static const xl4 = Radius.circular(24);

  /// Full radius of 9999, typically used for circular shapes.
  static const full = Radius.circular(9999);
}
