import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_dropdown_theme}
/// Theme class which provides configuration of [AppDropdownItem]
/// {@endtemplate}
class AppDropdownTheme extends ThemeExtension<AppDropdownTheme> {
  /// {@macro app_avatar_theme}
  const AppDropdownTheme({
    required this.defaultText,
    required this.disabledText,
    required this.focusedBorder,
    required this.hoverColor,
    required this.selectedHoverColor,
  });

  /// {@macro app_avatar_theme}
  factory AppDropdownTheme.light() {
    return AppDropdownTheme(
      defaultText: AppColors.brand.shade500,
      disabledText: AppColors.brand[250]!,
      focusedBorder: AppColors.brand[250]!,
      hoverColor: AppColors.brand.shade100,
      selectedHoverColor: AppColors.brand[150]!,
    );
  }

  final Color defaultText;

  final Color disabledText;

  final Color focusedBorder;

  final Color hoverColor;

  final Color selectedHoverColor;

  @override
  ThemeExtension<AppDropdownTheme> copyWith({
    Color? textColor,
    Color? disabledTextColor,
    Color? focusedBorder,
    Color? hoverColor,
    Color? selectedHoverColor,
  }) {
    return AppDropdownTheme(
      defaultText: textColor ?? this.defaultText,
      disabledText: disabledTextColor ?? this.disabledText,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      hoverColor: hoverColor ?? this.hoverColor,
      selectedHoverColor: selectedHoverColor ?? this.selectedHoverColor,
    );
  }

  @override
  ThemeExtension<AppDropdownTheme> lerp(
    covariant ThemeExtension<AppDropdownTheme>? other,
    double t,
  ) {
    if (other is! AppDropdownTheme) {
      return this;
    }

    return AppDropdownTheme(
      defaultText: Color.lerp(defaultText, other.defaultText, t)!,
      disabledText: Color.lerp(disabledText, other.disabledText, t)!,
      focusedBorder: Color.lerp(focusedBorder, other.focusedBorder, t)!,
      hoverColor: Color.lerp(hoverColor, other.hoverColor, t)!,
      selectedHoverColor: Color.lerp(
        selectedHoverColor,
        other.selectedHoverColor,
        t,
      )!,
    );
  }
}
