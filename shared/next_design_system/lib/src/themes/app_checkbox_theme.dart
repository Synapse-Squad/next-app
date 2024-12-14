import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_checkbox_theme}
/// Theme class which provides configuration of [AppCheckbox]
/// {@endtemplate}
class AppCheckboxTheme extends ThemeExtension<AppCheckboxTheme> {
  /// {@macro app_checkbox_theme}
  const AppCheckboxTheme({
    required this.borderColor,
    required this.disabledBorderColor,
    required this.enabledColor,
    required this.disabledColor,
  });

  /// {@macro app_checkbox_theme}
  factory AppCheckboxTheme.light() {
    return AppCheckboxTheme(
      borderColor: AppColors.brand,
      disabledBorderColor: AppColors.lightGray,
      enabledColor: AppColors.brand,
      disabledColor: AppColors.extraLightGray,
    );
  }

  /// {@macro app_checkbox_theme}
  factory AppCheckboxTheme.dark() {
    return AppCheckboxTheme(
      borderColor: AppColors.brand,
      disabledBorderColor: AppColors.lightGray,
      enabledColor: AppColors.brand,
      disabledColor: AppColors.darkGray,
    );
  }

  /// The default border color.
  final Color borderColor;

  /// The border color when disabled.
  final Color disabledBorderColor;

  /// The active color.
  final Color enabledColor;

  /// The disabled color.
  final Color disabledColor;

  @override
  ThemeExtension<AppCheckboxTheme> copyWith({
    Color? borderColor,
    Color? disabledBorderColor,
    Color? enabledTrackColor,
    Color? disabledTrackColor,
  }) {
    return AppCheckboxTheme(
      borderColor: borderColor ?? this.borderColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      enabledColor: enabledTrackColor ?? this.enabledColor,
      disabledColor: disabledTrackColor ?? this.disabledColor,
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
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      disabledBorderColor:
          Color.lerp(disabledBorderColor, other.disabledBorderColor, t)!,
      enabledColor: Color.lerp(enabledColor, other.enabledColor, t)!,
      disabledColor: Color.lerp(disabledColor, other.disabledColor, t)!,
    );
  }
}
