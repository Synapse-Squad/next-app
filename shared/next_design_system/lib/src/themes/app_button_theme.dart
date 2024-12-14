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
    required this.primaryTextOnBrand,
    required this.buttonLineDefault,
    required this.primaryDefault,
    required this.primaryHover,
    required this.primaryFocused,
    required this.primaryDisabled,
    required this.secondaryDefault,
    required this.secondaryHover,
    required this.secondaryFocused,
    required this.secondaryDisabled,
    required this.outlinedDefault,
    required this.outlinedHover,
    required this.outlinedFocused,
    required this.outlinedDisabled,
    required this.outlinedBorderDisabled,
    required this.linkDefault,
    required this.linkHover,
    required this.linkFocused,
    required this.linkDisabled,
  });

  /// {@macro app_button_theme}
  factory AppButtonTheme.light() {
    return AppButtonTheme(
      primaryText: AppColors.white,
      primaryTextDisabled: AppColors.brand[150]!,
      primaryTextOnBrand: AppColors.brand.shade500,
      buttonLineDefault: AppColors.brand.shade500,
      primaryDefault: AppColors.brand.shade500,
      primaryHover: AppColors.brand.shade600,
      primaryFocused: AppColors.brand.shade700,
      primaryDisabled: AppColors.brand.shade50,
      secondaryDefault: AppColors.brand.shade100,
      secondaryHover: AppColors.brand[150]!,
      secondaryFocused: AppColors.brand.shade200,
      secondaryDisabled: AppColors.brand.shade50,
      outlinedDefault: AppColors.white,
      outlinedHover: AppColors.brand.shade50,
      outlinedFocused: AppColors.brand.shade100,
      outlinedDisabled: AppColors.white,
      outlinedBorderDisabled: AppColors.brand[150]!,
      linkDefault: AppColors.transparent,
      linkHover: AppColors.brand.shade50,
      linkFocused: AppColors.brand[150]!,
      linkDisabled: AppColors.white,
    );
  }

  /// The color of the primary text.
  final Color primaryText;

  /// The color of the primary text when disabled.
  final Color primaryTextDisabled;

  /// The color of the primary text on the brand color.
  final Color primaryTextOnBrand;

  /// The color of the button line default.
  final Color buttonLineDefault;

  /// The color of the primary button default.
  final Color primaryDefault;

  /// The color of the primary button hover.
  final Color primaryHover;

  /// The color of the primary button focused.
  final Color primaryFocused;

  /// The color of the primary button disabled.
  final Color primaryDisabled;

  /// The color of the secondary button default.
  final Color secondaryDefault;

  /// The color of the secondary button hover.
  final Color secondaryHover;

  /// The color of the secondary button focused.
  final Color secondaryFocused;

  /// The color of the secondary button disabled.
  final Color secondaryDisabled;

  /// The color of the outlined button default.
  final Color outlinedDefault;

  /// The color of the outlined button hover.
  final Color outlinedHover;

  /// The color of the outlined button focused.
  final Color outlinedFocused;

  /// The color of the outlined button disabled.
  final Color outlinedDisabled;

  /// The color of the outlined button border disabled.
  final Color outlinedBorderDisabled;

  /// The color of the link default.
  final Color linkDefault;

  /// The color of the link hover.
  final Color linkHover;

  /// The color of the link focused.
  final Color linkFocused;

  /// The color of the link disabled.
  final Color linkDisabled;

  @override
  ThemeExtension<AppButtonTheme> copyWith({
    Color? primaryText,
    Color? primaryTextDisabled,
    Color? secondaryGrayText,
    Color? secondaryGrayTextDisabled,
    Color? primaryTextOnBrand,
    Color? secondaryBorderGrayDefault,
    Color? secondaryBorderGrayFocused,
    Color? secondaryBorderGrayDisabled,
    Color? buttonLineDefault,
    Color? primaryDefault,
    Color? primaryHover,
    Color? primaryFocused,
    Color? primaryDisabled,
    Color? secondaryDefault,
    Color? secondaryHover,
    Color? secondaryFocused,
    Color? secondaryDisabled,
    Color? secondaryGrayDefault,
    Color? secondaryGrayHover,
    Color? secondaryGrayFocused,
    Color? secondaryGrayDisabled,
    Color? outlinedDefault,
    Color? outlinedHover,
    Color? outlinedFocused,
    Color? outlinedDisabled,
    Color? outlinedBorderDisabled,
    Color? linkDefault,
    Color? linkHover,
    Color? linkFocused,
    Color? linkDisabled,
  }) {
    return AppButtonTheme(
      primaryText: primaryText ?? this.primaryText,
      primaryTextDisabled: primaryTextDisabled ?? this.primaryTextDisabled,
      primaryTextOnBrand: primaryTextOnBrand ?? this.primaryTextOnBrand,
      buttonLineDefault: buttonLineDefault ?? this.buttonLineDefault,
      primaryDefault: primaryDefault ?? this.primaryDefault,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryFocused: primaryFocused ?? this.primaryFocused,
      primaryDisabled: primaryDisabled ?? this.primaryDisabled,
      secondaryDefault: secondaryDefault ?? this.secondaryDefault,
      secondaryHover: secondaryHover ?? this.secondaryHover,
      secondaryFocused: secondaryFocused ?? this.secondaryFocused,
      secondaryDisabled: secondaryDisabled ?? this.secondaryDisabled,
      outlinedDefault: outlinedDefault ?? this.outlinedDefault,
      outlinedHover: outlinedHover ?? this.outlinedHover,
      outlinedFocused: outlinedFocused ?? this.outlinedFocused,
      outlinedDisabled: outlinedDisabled ?? this.outlinedDisabled,
      outlinedBorderDisabled:
          outlinedBorderDisabled ?? this.outlinedBorderDisabled,
      linkDefault: linkDefault ?? this.linkDefault,
      linkHover: linkHover ?? this.linkHover,
      linkFocused: linkFocused ?? this.linkFocused,
      linkDisabled: linkDisabled ?? this.linkDisabled,
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
      primaryTextOnBrand: Color.lerp(
        primaryTextOnBrand,
        other.primaryTextOnBrand,
        t,
      )!,
      buttonLineDefault: Color.lerp(
        buttonLineDefault,
        other.buttonLineDefault,
        t,
      )!,
      primaryDefault: Color.lerp(primaryDefault, other.primaryDefault, t)!,
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t)!,
      primaryFocused: Color.lerp(primaryFocused, other.primaryFocused, t)!,
      primaryDisabled: Color.lerp(primaryDisabled, other.primaryDisabled, t)!,
      secondaryDefault:
          Color.lerp(secondaryDefault, other.secondaryDefault, t)!,
      secondaryHover: Color.lerp(secondaryHover, other.secondaryHover, t)!,
      secondaryFocused: Color.lerp(
        secondaryFocused,
        other.secondaryFocused,
        t,
      )!,
      secondaryDisabled: Color.lerp(
        secondaryDisabled,
        other.secondaryDisabled,
        t,
      )!,
      outlinedDefault: Color.lerp(outlinedDefault, other.outlinedDefault, t)!,
      outlinedHover: Color.lerp(outlinedHover, other.outlinedHover, t)!,
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
      linkHover: Color.lerp(linkHover, other.linkHover, t)!,
      linkFocused: Color.lerp(linkFocused, other.linkFocused, t)!,
      linkDisabled: Color.lerp(linkDisabled, other.linkDisabled, t)!,
    );
  }
}
