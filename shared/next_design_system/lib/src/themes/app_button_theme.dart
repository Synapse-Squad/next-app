import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_button_theme}
/// Theme class which provides configuration of buttons
/// {@endtemplate}
class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
  /// {@macro app_button_theme}
  const AppButtonTheme({
    required this.primaryText,
    required this.primaryTextDisabled,
    required this.buttonLineDefault,
    required this.primaryDefault,
    required this.primaryFocused,
    required this.primaryDisabled,
    required this.outlinedDefault,
    required this.outlinedFocused,
    required this.outlinedDisabled,
    required this.outlinedBorderDisabled,
    required this.linkDefault,
    required this.linkFocused,
    required this.linkDisabled,
    required this.linkText,
  });

  /// {@macro app_button_theme}
  factory AppButtonTheme.light() {
    return AppButtonTheme(
      primaryText: AppColors.white,
      primaryTextDisabled: AppColors.darkGray,
      buttonLineDefault: AppColors.black,
      primaryDefault: AppColors.brand,
      primaryFocused: AppColors.brand,
      primaryDisabled: AppColors.lightGray,
      outlinedDefault: AppColors.transparent,
      outlinedFocused: AppColors.transparent,
      outlinedDisabled: AppColors.transparent,
      outlinedBorderDisabled: AppColors.darkGray,
      linkDefault: AppColors.transparent,
      linkFocused: AppColors.transparent,
      linkDisabled: AppColors.transparent,
      linkText: AppColors.black,
    );
  }

  /// {@macro app_button_theme}
  factory AppButtonTheme.dark() {
    return AppButtonTheme(
      primaryText: AppColors.white,
      primaryTextDisabled: AppColors.darkGray,
      buttonLineDefault: AppColors.white,
      primaryDefault: AppColors.brand,
      primaryFocused: AppColors.brand,
      primaryDisabled: AppColors.lightGray,
      outlinedDefault: AppColors.transparent,
      outlinedFocused: AppColors.transparent,
      outlinedDisabled: AppColors.transparent,
      outlinedBorderDisabled: AppColors.darkGray,
      linkDefault: AppColors.transparent,
      linkFocused: AppColors.transparent,
      linkDisabled: AppColors.transparent,
      linkText: AppColors.white,
    );
  }

  /// The color of the primary text.
  final Color primaryText;

  /// The color of the primary text when disabled.
  final Color primaryTextDisabled;

  /// The color of the button line default.
  final Color buttonLineDefault;

  /// The color of the primary button default.
  final Color primaryDefault;

  /// The color of the primary button focused.
  final Color primaryFocused;

  /// The color of the primary button disabled.
  final Color primaryDisabled;

  /// The color of the outlined button default.
  final Color outlinedDefault;

  /// The color of the outlined button focused.
  final Color outlinedFocused;

  /// The color of the outlined button disabled.
  final Color outlinedDisabled;

  /// The color of the outlined button border disabled.
  final Color outlinedBorderDisabled;

  /// The color of the link default.
  final Color linkDefault;

  /// The color of the link focused.
  final Color linkFocused;

  /// The color of the link disabled.
  final Color linkDisabled;

  /// The default color of the link text.
  final Color linkText;

  @override
  ThemeExtension<AppButtonTheme> copyWith({
    Color? primaryText,
    Color? primaryTextDisabled,
    Color? buttonLineDefault,
    Color? primaryDefault,
    Color? primaryFocused,
    Color? primaryDisabled,
    Color? outlinedDefault,
    Color? outlinedFocused,
    Color? outlinedDisabled,
    Color? outlinedBorderDisabled,
    Color? linkDefault,
    Color? linkFocused,
    Color? linkDisabled,
    Color? linkText,
  }) {
    return AppButtonTheme(
      primaryText: primaryText ?? this.primaryText,
      primaryTextDisabled: primaryTextDisabled ?? this.primaryTextDisabled,
      buttonLineDefault: buttonLineDefault ?? this.buttonLineDefault,
      primaryDefault: primaryDefault ?? this.primaryDefault,
      primaryFocused: primaryFocused ?? this.primaryFocused,
      primaryDisabled: primaryDisabled ?? this.primaryDisabled,
      outlinedDefault: outlinedDefault ?? this.outlinedDefault,
      outlinedFocused: outlinedFocused ?? this.outlinedFocused,
      outlinedDisabled: outlinedDisabled ?? this.outlinedDisabled,
      outlinedBorderDisabled:
          outlinedBorderDisabled ?? this.outlinedBorderDisabled,
      linkDefault: linkDefault ?? this.linkDefault,
      linkFocused: linkFocused ?? this.linkFocused,
      linkDisabled: linkDisabled ?? this.linkDisabled,
      linkText: linkText ?? this.linkText,
    );
  }

  @override
  ThemeExtension<AppButtonTheme> lerp(
    covariant ThemeExtension<AppButtonTheme>? other,
    double t,
  ) {
    if (other is! AppButtonTheme) {
      return this;
    }

    return AppButtonTheme(
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      primaryTextDisabled: Color.lerp(
        primaryTextDisabled,
        other.primaryTextDisabled,
        t,
      )!,
      buttonLineDefault: Color.lerp(
        buttonLineDefault,
        other.buttonLineDefault,
        t,
      )!,
      primaryDefault: Color.lerp(primaryDefault, other.primaryDefault, t)!,
      primaryFocused: Color.lerp(primaryFocused, other.primaryFocused, t)!,
      primaryDisabled: Color.lerp(primaryDisabled, other.primaryDisabled, t)!,
      outlinedDefault: Color.lerp(outlinedDefault, other.outlinedDefault, t)!,
      outlinedFocused: Color.lerp(outlinedFocused, other.outlinedFocused, t)!,
      outlinedDisabled: Color.lerp(
        outlinedDisabled,
        other.outlinedDisabled,
        t,
      )!,
      outlinedBorderDisabled: Color.lerp(
        outlinedBorderDisabled,
        other.outlinedBorderDisabled,
        t,
      )!,
      linkDefault: Color.lerp(linkDefault, other.linkDefault, t)!,
      linkFocused: Color.lerp(linkFocused, other.linkFocused, t)!,
      linkDisabled: Color.lerp(linkDisabled, other.linkDisabled, t)!,
      linkText: Color.lerp(linkText, other.linkText, t)!,
    );
  }
}
