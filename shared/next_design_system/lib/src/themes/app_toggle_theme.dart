import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_toggle_theme}
/// Theme class which provides configuration of [AppToggle]
/// {@endtemplate}
class AppToggleTheme extends ThemeExtension<AppToggleTheme> {
  /// {@macro app_toggle_theme}
  const AppToggleTheme({
    required this.enabledTrackColor,
    required this.activeColor,
    required this.disabledTrackColor,
    required this.inactiveThumbColor,
  });

  /// {@macro app_toggle_theme}
  factory AppToggleTheme.light() {
    return AppToggleTheme(
      enabledTrackColor: AppColors.brand,
      disabledTrackColor: AppColors.darkGray,
      activeColor: AppColors.white,
      inactiveThumbColor: AppColors.lightGray,
    );
  }

  /// {@macro app_toggle_theme}
  factory AppToggleTheme.dark() {
    return AppToggleTheme(
      enabledTrackColor: AppColors.brand,
      disabledTrackColor: AppColors.darkGray,
      activeColor: AppColors.white,
      inactiveThumbColor: AppColors.lightGray,
    );
  }

  /// The active color.
  final Color enabledTrackColor;

  /// The disabled color.
  final Color disabledTrackColor;

  /// The active color.
  final Color activeColor;

  /// The inactive thumb color.
  final Color inactiveThumbColor;

  @override
  ThemeExtension<AppToggleTheme> copyWith({
    Color? enabledTrackColor,
    Color? disabledTrackColor,
    Color? activeColor,
    Color? inactiveThumbColor,
  }) {
    return AppToggleTheme(
      enabledTrackColor: enabledTrackColor ?? this.enabledTrackColor,
      disabledTrackColor: disabledTrackColor ?? this.disabledTrackColor,
      activeColor: activeColor ?? this.activeColor,
      inactiveThumbColor: inactiveThumbColor ?? this.inactiveThumbColor,
    );
  }

  @override
  ThemeExtension<AppToggleTheme> lerp(
    covariant ThemeExtension<AppToggleTheme>? other,
    double t,
  ) {
    if (other is! AppToggleTheme) {
      return this;
    }

    return AppToggleTheme(
      enabledTrackColor: Color.lerp(
        enabledTrackColor,
        other.enabledTrackColor,
        t,
      )!,
      disabledTrackColor: Color.lerp(
        disabledTrackColor,
        other.disabledTrackColor,
        t,
      )!,
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      inactiveThumbColor: Color.lerp(
        inactiveThumbColor,
        other.inactiveThumbColor,
        t,
      )!,
    );
  }
}
