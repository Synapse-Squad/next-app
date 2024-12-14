import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_icon_theme}
/// Theme class which provides configuration of [Icon]
/// {@endtemplate}
class AppIconTheme extends ThemeExtension<AppIconTheme> {
  /// {@macro app_icon_theme}
  const AppIconTheme({
    required this.white,
    required this.brand,
    required this.gray,
    required this.success,
    required this.error,
    required this.disabled,
  });

  /// {@macro app_icon_theme}
  factory AppIconTheme.light() {
    return AppIconTheme(
      white: AppColors.white,
      brand: AppColors.brand.shade500,
      gray: AppColors.brand.shade600,
      success: AppColors.brand.shade400,
      error: AppColors.brand.shade400,
      disabled: AppColors.brand[250]!,
    );
  }

  /// The color white
  final Color white;

  /// The brand color
  final Color brand;

  /// The gray color
  final Color gray;

  /// The success color
  final Color success;

  /// The error color
  final Color error;

  /// The disabled color
  final Color disabled;

  @override
  ThemeExtension<AppIconTheme> copyWith({
    Color? white,
    Color? brand,
    Color? gray,
    Color? success,
    Color? error,
    Color? disabledTrackColor,
  }) {
    return AppIconTheme(
      white: white ?? this.white,
      brand: brand ?? this.brand,
      gray: gray ?? this.gray,
      success: success ?? this.success,
      error: error ?? this.error,
      disabled: disabledTrackColor ?? this.disabled,
    );
  }

  @override
  ThemeExtension<AppIconTheme> lerp(
    covariant ThemeExtension<AppIconTheme>? other,
    double t,
  ) {
    if (other is! AppIconTheme) {
      return this;
    }

    return AppIconTheme(
      white: Color.lerp(white, other.white, t)!,
      brand: Color.lerp(brand, other.brand, t)!,
      gray: Color.lerp(gray, other.gray, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
    );
  }
}
