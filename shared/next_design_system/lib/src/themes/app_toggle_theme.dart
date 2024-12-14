import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_toggle_theme}
/// Theme class which provides configuration of [AppToggle]
/// {@endtemplate}
class AppToggleTheme extends ThemeExtension<AppToggleTheme> {
  /// {@macro app_toggle_theme}
  const AppToggleTheme({
    required this.active,
    required this.disabled,
  });

  /// {@macro app_toggle_theme}
  factory AppToggleTheme.light() {
    return AppToggleTheme(
      active: AppColors.brand.shade500,
      disabled: AppColors.brand[150]!,
    );
  }

  /// The active color.
  final Color active;

  /// The disabled color.
  final Color disabled;

  @override
  ThemeExtension<AppToggleTheme> copyWith({
    Color? active,
    Color? disabled,
  }) {
    return AppToggleTheme(
      active: active ?? this.active,
      disabled: disabled ?? this.disabled,
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
      active: Color.lerp(active, other.active, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
    );
  }
}
