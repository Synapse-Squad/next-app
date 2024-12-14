import 'package:flutter/material.dart';

import 'themes/app_theme.dart';

/// {@template theme_scope}
/// InheritedWidget provides [AppTheme] for app
/// {@endtemplate}
class ThemeScope extends InheritedWidget {
  /// {@macro theme_scope}
  const ThemeScope({
    super.key,
    required Widget child,
    required this.themeMode,
    required this.lightTheme,
    required this.darkTheme,
  }) : super(child: child);

  /// The current theme mode.
  final ThemeMode themeMode;

  /// The current light theme.
  final AppTheme lightTheme;

  /// The current dark theme.
  final AppTheme darkTheme;

  /// The current theme.
  static ThemeScope of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert(result != null, 'No ThemeScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeScope oldWidget) => true;
}
