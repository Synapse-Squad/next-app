import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_layout_theme}
/// Theme class which provides configuration of [AppLayoutTheme]
/// {@endtemplate}
class AppLayoutTheme extends ThemeExtension<AppLayoutTheme> {
  /// {@macro app_layout_theme}
  const AppLayoutTheme({
    required this.pageBackground,
    required this.textColor,
  });

  /// {@macro app_layout_theme}
  factory AppLayoutTheme.light() {
    return AppLayoutTheme(
      pageBackground: AppColors.white,
      textColor: AppColors.black,
    );
  }

  /// {@macro app_layout_theme}
  factory AppLayoutTheme.dark() {
    return AppLayoutTheme(
      pageBackground: AppColors.black,
      textColor: AppColors.white,
    );
  }

  /// background color of page
  final Color pageBackground;

  /// default text color for app
  final Color textColor;

  @override
  ThemeExtension<AppLayoutTheme> copyWith({
    Color? pageBackground,
    Color? textColor,
  }) {
    return AppLayoutTheme(
      pageBackground: pageBackground ?? this.pageBackground,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<AppLayoutTheme> lerp(
    covariant ThemeExtension<AppLayoutTheme>? other,
    double t,
  ) {
    if (other is! AppLayoutTheme) {
      return this;
    }

    return AppLayoutTheme(
      pageBackground: Color.lerp(pageBackground, other.pageBackground, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }
}
