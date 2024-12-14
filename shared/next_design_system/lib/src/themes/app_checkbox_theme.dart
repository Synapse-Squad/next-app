import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_checkbox_theme}
/// Theme class which provides configuration of [AppCheckbox]
/// {@endtemplate}
class AppCheckboxTheme extends ThemeExtension<AppCheckboxTheme> {
  /// {@macro app_checkbox_theme}
  const AppCheckboxTheme({
    required this.borderDefault,
    required this.borderHover,
    required this.borderDisabled,
    required this.active,
    required this.disabled,
  });

  /// {@macro app_checkbox_theme}
  factory AppCheckboxTheme.light() {
    return AppCheckboxTheme(
      borderDefault: AppColors.brand[250]!,
      borderHover: AppColors.brand.shade300,
      borderDisabled: AppColors.brand.shade200,
      active: AppColors.brand.shade500,
      disabled: AppColors.brand[150]!,
    );
  }

  /// The default border color.
  final Color borderDefault;

  /// The border color when hovered.
  final Color borderHover;

  /// The border color when disabled.
  final Color borderDisabled;

  /// The active color.
  final Color active;

  /// The disabled color.
  final Color disabled;

  @override
  ThemeExtension<AppCheckboxTheme> copyWith({
    Color? borderColor,
    Color? borderHover,
    Color? disabledBorderColor,
    Color? active,
    Color? disabled,
  }) {
    return AppCheckboxTheme(
      borderDefault: borderColor ?? this.borderDefault,
      borderHover: borderHover ?? this.borderHover,
      borderDisabled: disabledBorderColor ?? this.borderDisabled,
      active: active ?? this.active,
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  ThemeExtension<AppCheckboxTheme> lerp(
    covariant ThemeExtension<AppCheckboxTheme>? other,
    double t,
  ) {
    if (other is! AppCheckboxTheme) {
      return this;
    }

    return AppCheckboxTheme(
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderHover: Color.lerp(borderHover, other.borderHover, t)!,
      borderDisabled: Color.lerp(borderDisabled, other.borderDisabled, t)!,
      active: Color.lerp(active, other.active, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
    );
  }
}
