import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_badge_theme}
/// Theme class which provides configuration of [AppBadge]
/// {@endtemplate}
class AppBadgeTheme extends ThemeExtension<AppBadgeTheme> {
  /// {@macro app_badge_theme}
  const AppBadgeTheme({
    required this.textColor,
    required this.backgroundColor,
    required this.selectedBackgroundColor,
    required this.selectedTextColor,
  });

  /// {@macro app_badge_theme}
  factory AppBadgeTheme.light() {
    return AppBadgeTheme(
      textColor: AppColors.black,
      backgroundColor: AppColors.lightGray,
      selectedBackgroundColor: AppColors.black,
      selectedTextColor: AppColors.white,
    );
  }

  /// {@macro app_badge_theme}
  factory AppBadgeTheme.dark() {
    return AppBadgeTheme(
      textColor: AppColors.white,
      backgroundColor: AppColors.darkGray,
      selectedBackgroundColor: AppColors.white,
      selectedTextColor: AppColors.black,
    );
  }

  /// text color for badge
  final Color textColor;

  /// background color for badge
  final Color backgroundColor;

  /// background color for selected badge
  final Color selectedBackgroundColor;

  /// text color for selected badge
  final Color selectedTextColor;

  @override
  ThemeExtension<AppBadgeTheme> copyWith({
    Color? textColor,
    Color? backgroundColor,
    Color? selectedBackgroundColor,
    Color? selectedTextColor,
  }) {
    return AppBadgeTheme(
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedBackgroundColor:
          selectedBackgroundColor ?? this.selectedBackgroundColor,
      selectedTextColor: selectedTextColor ?? this.selectedTextColor,
    );
  }

  @override
  ThemeExtension<AppBadgeTheme> lerp(
    covariant ThemeExtension<AppBadgeTheme>? other,
    double t,
  ) {
    if (other is! AppBadgeTheme) {
      return this;
    }

    return AppBadgeTheme(
      textColor: Color.lerp(textColor, other.textColor, t)!,
      backgroundColor: Color.lerp(
        backgroundColor,
        other.backgroundColor,
        t,
      )!,
      selectedBackgroundColor: Color.lerp(
        selectedBackgroundColor,
        other.selectedBackgroundColor,
        t,
      )!,
      selectedTextColor: Color.lerp(
        selectedTextColor,
        other.selectedTextColor,
        t,
      )!,
    );
  }
}
