import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_badge_theme}
/// Theme class which provides configuration of [AppBadge]
/// {@endtemplate}
class AppBadgeTheme extends ThemeExtension<AppBadgeTheme> {
  /// {@macro app_badge_theme}
  const AppBadgeTheme({
    required this.badgeTextGray,
    required this.badgeTextSuccess,
    required this.badgeTextBlueLight,
    required this.badgeTextError,
    required this.badgeTextWarning,
    required this.badgeBorderGray,
    required this.badgeBorderSuccess,
    required this.badgeBorderBlueLight,
    required this.badgeBorderError,
    required this.badgeBorderWarning,
    required this.badgeGray,
    required this.badgeSuccess,
    required this.badgeBlueLight,
    required this.badgeError,
    required this.badgeWarning,
  });

  /// {@macro app_badge_theme}
  factory AppBadgeTheme.light() {
    return AppBadgeTheme(
      badgeTextGray: AppColors.brand.shade500,
      badgeTextSuccess: AppColors.brand.shade500,
      badgeTextBlueLight: AppColors.brand.shade600,
      badgeTextError: AppColors.error.shade500,
      badgeTextWarning: AppColors.brand.shade500,
      badgeBorderGray: AppColors.brand.shade200,
      badgeBorderSuccess: AppColors.brand.shade200,
      badgeBorderBlueLight: AppColors.brand.shade200,
      badgeBorderError: AppColors.error.shade200,
      badgeBorderWarning: AppColors.brand.shade200,
      badgeGray: AppColors.brand.shade50,
      badgeSuccess: AppColors.brand.shade100,
      badgeBlueLight: AppColors.brand.shade100,
      badgeError: AppColors.error.shade100,
      badgeWarning: AppColors.brand.shade100,
    );
  }

  /// AppColors.grayLight.shade500
  final Color badgeTextGray;

  /// AppColors.success.shade500
  final Color badgeTextSuccess;

  /// AppColors.success.shade500
  final Color badgeTextBlueLight;

  /// AppColors.error.shade500
  final Color badgeTextError;

  /// AppColors.warning.shade500
  final Color badgeTextWarning;

  /// AppColors.grayLight.shade200
  final Color badgeBorderGray;

  /// AppColors.success.shade200
  final Color badgeBorderSuccess;

  /// AppColors.success.shade200
  final Color badgeBorderBlueLight;

  /// AppColors.error.shade200
  final Color badgeBorderError;

  /// AppColors.warning.shade200
  final Color badgeBorderWarning;

  /// AppColors.grayLight.shade50
  final Color badgeGray;

  /// AppColors.success.shade100
  final Color badgeSuccess;

  /// AppColors.success.shade100
  final Color badgeBlueLight;

  /// AppColors.error.shade100
  final Color badgeError;

  /// AppColors.warning.shade100
  final Color badgeWarning;

  @override
  ThemeExtension<AppBadgeTheme> copyWith({
    Color? badgeTextGray,
    Color? badgeTextSuccess,
    Color? badgeTextBlueLight,
    Color? badgeTextError,
    Color? badgeTextWarning,
    Color? badgeBorderGray,
    Color? badgeBorderSuccess,
    Color? badgeBorderBlueLight,
    Color? badgeBorderError,
    Color? badgeBorderWarning,
    Color? badgeGray,
    Color? badgeSuccess,
    Color? badgeBlueLight,
    Color? badgeError,
    Color? badgeWarning,
  }) {
    return AppBadgeTheme(
      badgeTextGray: badgeTextGray ?? this.badgeTextGray,
      badgeTextSuccess: badgeTextSuccess ?? this.badgeTextSuccess,
      badgeTextBlueLight: badgeTextBlueLight ?? this.badgeTextBlueLight,
      badgeTextError: badgeTextError ?? this.badgeTextError,
      badgeTextWarning: badgeTextWarning ?? this.badgeTextWarning,
      badgeBorderGray: badgeBorderGray ?? this.badgeBorderGray,
      badgeBorderSuccess: badgeBorderSuccess ?? this.badgeBorderSuccess,
      badgeBorderBlueLight: badgeBorderBlueLight ?? this.badgeBorderBlueLight,
      badgeBorderError: badgeBorderError ?? this.badgeBorderError,
      badgeBorderWarning: badgeBorderWarning ?? this.badgeBorderWarning,
      badgeGray: badgeGray ?? this.badgeGray,
      badgeSuccess: badgeSuccess ?? this.badgeSuccess,
      badgeBlueLight: badgeBlueLight ?? this.badgeBlueLight,
      badgeError: badgeError ?? this.badgeError,
      badgeWarning: badgeWarning ?? this.badgeWarning,
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
      badgeTextGray: Color.lerp(badgeTextGray, other.badgeTextGray, t)!,
      badgeTextSuccess: Color.lerp(
        badgeTextSuccess,
        other.badgeTextSuccess,
        t,
      )!,
      badgeTextBlueLight: Color.lerp(
        badgeTextBlueLight,
        other.badgeTextBlueLight,
        t,
      )!,
      badgeTextError: Color.lerp(badgeTextError, other.badgeTextError, t)!,
      badgeTextWarning: Color.lerp(
        badgeTextWarning,
        other.badgeTextWarning,
        t,
      )!,
      badgeBorderGray: Color.lerp(badgeBorderGray, other.badgeBorderGray, t)!,
      badgeBorderSuccess: Color.lerp(
        badgeBorderSuccess,
        other.badgeBorderSuccess,
        t,
      )!,
      badgeBorderBlueLight: Color.lerp(
        badgeBorderBlueLight,
        other.badgeBorderBlueLight,
        t,
      )!,
      badgeBorderError: Color.lerp(
        badgeBorderError,
        other.badgeBorderError,
        t,
      )!,
      badgeBorderWarning: Color.lerp(
        badgeBorderWarning,
        other.badgeBorderWarning,
        t,
      )!,
      badgeGray: Color.lerp(badgeGray, other.badgeGray, t)!,
      badgeSuccess: Color.lerp(badgeSuccess, other.badgeSuccess, t)!,
      badgeBlueLight: Color.lerp(badgeBlueLight, other.badgeBlueLight, t)!,
      badgeError: Color.lerp(badgeError, other.badgeError, t)!,
      badgeWarning: Color.lerp(badgeWarning, other.badgeWarning, t)!,
    );
  }
}
