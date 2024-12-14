import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_typography_theme}
/// Theme class which provides configuration of [AppTypographyTheme]
/// {@endtemplate}
class AppTypographyTheme extends ThemeExtension<AppTypographyTheme> {
  /// {@macro app_typography_theme}
  const AppTypographyTheme({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.brand,
    required this.brandHover,
  });

  /// {@macro app_typography_theme}
  factory AppTypographyTheme.light() {
    return AppTypographyTheme(
      title: AppColors.black,
      subTitle: AppColors.black,
      description: AppColors.black,
      brand: AppColors.brand[500]!,
      brandHover: AppColors.brand[600]!,
    );
  }

  /// The title color.
  final Color title;

  /// The subtitle color.
  final Color subTitle;

  /// The description color.
  final Color description;

  /// The brand color.
  final Color brand;

  /// The brand hover color.
  final Color brandHover;

  @override
  ThemeExtension<AppTypographyTheme> copyWith({
    Color? title,
    Color? subTitle,
    Color? description,
    Color? brand,
    Color? brandHover,
  }) {
    return AppTypographyTheme(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      description: description ?? this.description,
      brand: brand ?? this.brand,
      brandHover: brandHover ?? this.brandHover,
    );
  }

  @override
  ThemeExtension<AppTypographyTheme> lerp(
    covariant ThemeExtension<AppTypographyTheme>? other,
    double t,
  ) {
    if (other is! AppTypographyTheme) {
      return this;
    }

    return AppTypographyTheme(
      title: Color.lerp(title, other.title, t)!,
      subTitle: Color.lerp(subTitle, other.subTitle, t)!,
      description: Color.lerp(description, other.description, t)!,
      brand: Color.lerp(brand, other.brand, t)!,
      brandHover: Color.lerp(brandHover, other.brandHover, t)!,
    );
  }
}
