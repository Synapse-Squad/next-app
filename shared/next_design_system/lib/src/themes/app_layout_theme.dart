import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_layout_theme}
/// Theme class which provides configuration of [AppLayoutTheme]
/// {@endtemplate}
class AppLayoutTheme extends ThemeExtension<AppLayoutTheme> {
  /// {@macro app_layout_theme}
  const AppLayoutTheme(
      {required this.sidebarBorder,
      required this.cardBorder,
      required this.sidebarCardBackground,
      required this.sidebarBackground,
      required this.bodyCardBackground,
      required this.navBarBackground,
      required this.pageBackground});

  /// {@macro app_layout_theme}
  factory AppLayoutTheme.light() {
    return AppLayoutTheme(
      sidebarBorder: AppColors.brand[200]!,
      cardBorder: AppColors.brand[200]!,
      sidebarCardBackground: AppColors.brand[50]!,
      sidebarBackground: AppColors.white,
      bodyCardBackground: AppColors.white,
      navBarBackground: AppColors.brand[900]!,
      pageBackground: AppColors.black,
    );
  }

  /// The sidebar border color.
  final Color sidebarBorder;

  /// The card border color.
  final Color cardBorder;

  /// The sidebar card background color.
  final Color sidebarCardBackground;

  /// slider background color
  final Color sidebarBackground;

  /// The body background color.
  final Color bodyCardBackground;

  /// The navigation bar background color.
  final Color navBarBackground;

  /// Th
  final Color pageBackground;

  @override
  ThemeExtension<AppLayoutTheme> copyWith({
    Color? sidebarBorder,
    Color? cardBorder,
    Color? sidebarCardBackground,
    Color? sidebarBackground,
    Color? bodyCardBackground,
    Color? navBarBackground,
    Color? pageBackground,
  }) {
    return AppLayoutTheme(
      sidebarBorder: sidebarBorder ?? this.sidebarBorder,
      cardBorder: cardBorder ?? this.cardBorder,
      sidebarCardBackground:
          sidebarCardBackground ?? this.sidebarCardBackground,
      sidebarBackground: sidebarBackground ?? this.sidebarBackground,
      bodyCardBackground: bodyCardBackground ?? this.bodyCardBackground,
      navBarBackground: navBarBackground ?? this.navBarBackground,
      pageBackground: pageBackground ?? this.pageBackground,
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
      sidebarBorder: Color.lerp(sidebarBorder, other.sidebarBorder, t)!,
      cardBorder: Color.lerp(cardBorder, other.cardBorder, t)!,
      sidebarCardBackground:
          Color.lerp(sidebarCardBackground, other.sidebarCardBackground, t)!,
      sidebarBackground:
          Color.lerp(sidebarBackground, other.sidebarBackground, t)!,
      bodyCardBackground:
          Color.lerp(bodyCardBackground, other.bodyCardBackground, t)!,
      navBarBackground:
          Color.lerp(navBarBackground, other.navBarBackground, t)!,
      pageBackground: Color.lerp(pageBackground, other.pageBackground, t)!,
    );
  }
}
