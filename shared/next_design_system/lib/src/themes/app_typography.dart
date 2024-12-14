import 'package:flutter/material.dart';

/// {@template app_typography}
/// Theme class which provides configuration of [TextStyle]
/// {@endtemplate}
interface class AppTypography extends ThemeExtension<AppTypography> {
  /// {@macro app_typography}
  AppTypography({
    required this.subtitle16Medium,
    required this.button2XLarge,
    required this.buttonXLarge,
    required this.buttonLarge,
    required this.buttonMedium,
    required this.buttonSmall,
    required this.inputPlaceHolder,
    required this.inputHint,
    required this.titleMedium,
    required this.titleLarge,
    required this.subtitleSmall,
  });

  /// Subtitle 16 Medium
  final TextStyle subtitle16Medium;

  /// Button 2XLarge
  final TextStyle button2XLarge;

  /// Button XLarge
  final TextStyle buttonXLarge;

  /// Button Large
  final TextStyle buttonLarge;

  /// Button Medium
  final TextStyle buttonMedium;

  /// Button Small
  final TextStyle buttonSmall;

  /// Input Place Holder
  final TextStyle inputPlaceHolder;

  /// Input Hint
  final TextStyle inputHint;

  /// Medium Title
  final TextStyle titleMedium;

  /// Large Title
  final TextStyle titleLarge;

  /// Small Subtitle
  final TextStyle subtitleSmall;

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? subtitle16Medium,
    TextStyle? button2XLarge,
    TextStyle? buttonXLarge,
    TextStyle? buttonLarge,
    TextStyle? buttonMedium,
    TextStyle? buttonSmall,
    TextStyle? inputPlaceHolder,
    TextStyle? inputHint,
    TextStyle? titleMedium,
    TextStyle? titleLarge,
    TextStyle? subtitleSmall,
  }) {
    return AppTypography(
      subtitle16Medium: subtitle16Medium ?? this.subtitle16Medium,
      button2XLarge: button2XLarge ?? this.button2XLarge,
      buttonXLarge: buttonXLarge ?? this.buttonXLarge,
      buttonLarge: buttonLarge ?? this.buttonLarge,
      buttonMedium: buttonMedium ?? this.buttonMedium,
      buttonSmall: buttonSmall ?? this.buttonSmall,
      inputPlaceHolder: inputPlaceHolder ?? this.inputPlaceHolder,
      inputHint: inputHint ?? this.inputHint,
      titleMedium: titleMedium ?? this.titleMedium,
      titleLarge: titleLarge ?? this.titleLarge,
      subtitleSmall: subtitleSmall ?? this.subtitleSmall,
    );
  }

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    if (other is! AppTypography) {
      return this;
    }

    return AppTypography(
      subtitle16Medium:
          TextStyle.lerp(subtitle16Medium, other.subtitle16Medium, t)!,
      button2XLarge: TextStyle.lerp(button2XLarge, other.button2XLarge, t)!,
      buttonXLarge: TextStyle.lerp(buttonXLarge, other.buttonXLarge, t)!,
      buttonLarge: TextStyle.lerp(buttonLarge, other.buttonLarge, t)!,
      buttonMedium: TextStyle.lerp(buttonMedium, other.buttonMedium, t)!,
      buttonSmall: TextStyle.lerp(buttonSmall, other.buttonSmall, t)!,
      inputPlaceHolder: TextStyle.lerp(
        inputPlaceHolder,
        other.inputPlaceHolder,
        t,
      )!,
      inputHint: TextStyle.lerp(inputHint, other.inputHint, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      subtitleSmall: TextStyle.lerp(subtitleSmall, other.subtitleSmall, t)!,
    );
  }
}

/// {@macro app_typography}
class AppRegularTypography extends AppTypography {
  /// {@macro app_typography}
  AppRegularTypography({
    super.subtitle16Medium = const TextStyle(
      fontSize: 16,
      height: 20 / 16,
      fontWeight: FontWeight.w500,
    ),
    super.button2XLarge = const TextStyle(
      fontSize: 18,
      height: 24 / 18,
      fontWeight: FontWeight.w500,
    ),
    super.buttonXLarge = const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w500,
    ),
    super.buttonLarge = const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w500,
    ),
    super.buttonMedium = const TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
    ),
    super.buttonSmall = const TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
    ),
    super.inputPlaceHolder = const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w400,
    ),
    super.inputHint = const TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w400,
    ),
    super.titleMedium = const TextStyle(
      fontSize: 16,
      height: 20 / 16,
      fontWeight: FontWeight.w500,
    ),
    super.titleLarge = const TextStyle(
      fontSize: 20,
      height: 24 / 16,
      fontWeight: FontWeight.w500,
    ),
    super.subtitleSmall = const TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w400,
    ),
  });
}
