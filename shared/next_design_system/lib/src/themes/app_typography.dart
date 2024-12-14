import 'package:flutter/material.dart';

/// {@template app_typography}
/// Theme class which provides configuration of [TextStyle]
/// {@endtemplate}
interface class AppTypography extends ThemeExtension<AppTypography> {
  /// {@macro app_typography}
  AppTypography({
    required this.title40Bold,
    required this.title32Medium,
    required this.title32Bold,
    required this.title24Medium,
    required this.title24Bold,
    required this.subtitle24Medium,
    required this.subtitle24Bold,
    required this.subtitle20Medium,
    required this.subtitle20Bold,
    required this.subtitle16Medium,
    required this.subtitle16Bold,
    required this.description16Regular,
    required this.description16Medium,
    required this.description14Regular,
    required this.description14Medium,
    required this.description14Bold,
    required this.description12Regular,
    required this.description12Medium,
    required this.description12Bold,
    required this.button2XLarge,
    required this.buttonXLarge,
    required this.buttonLarge,
    required this.buttonMedium,
    required this.buttonSmall,
    required this.title40Medium,
    required this.inputPlaceHolder,
    required this.inputLabel,
    required this.inputHint,
    required this.navigationItemStyle,
    required this.massText20Regular,
    required this.massText16Regular,
  });

  /// Title  font size 40, medium weight
  final TextStyle title40Medium;

  /// Title font size 40, bold weight
  final TextStyle title40Bold;

  /// Title 32 Medium
  final TextStyle title32Medium;

  /// Title 32 Bold
  final TextStyle title32Bold;

  /// Title 24 Medium
  final TextStyle title24Medium;

  /// Title 24 Bold
  final TextStyle title24Bold;

  /// Subtitle 24 Medium
  final TextStyle subtitle24Medium;

  /// Subtitle 24 Bold
  final TextStyle subtitle24Bold;

  /// Subtitle 20 Medium
  final TextStyle subtitle20Medium;

  /// Subtitle 20 Bold
  final TextStyle subtitle20Bold;

  /// Subtitle 16 Medium
  final TextStyle subtitle16Medium;

  /// Subtitle 16 Bold
  final TextStyle subtitle16Bold;

  /// Description 16 Regular
  final TextStyle description16Regular;

  /// Description 16 Medium
  final TextStyle description16Medium;

  /// Description 14 Regular
  final TextStyle description14Regular;

  /// Description 14 Medium
  final TextStyle description14Medium;

  /// Description 14 Bold
  final TextStyle description14Bold;

  /// Description 12 Regular
  final TextStyle description12Regular;

  /// Description 12 Medium
  final TextStyle description12Medium;

  /// Description 12 Bold
  final TextStyle description12Bold;

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

  /// Input Label
  final TextStyle inputLabel;

  /// Input Hint
  final TextStyle inputHint;

  /// Navigation Item style
  final TextStyle navigationItemStyle;

  /// Mass Text 20 Regular
  final TextStyle massText20Regular;

  /// Mass Text 16 Regular
  final TextStyle massText16Regular;

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? title40Medium,
    TextStyle? title32Medium,
    TextStyle? title40Bold,
    TextStyle? title32Bold,
    TextStyle? title24Medium,
    TextStyle? title24Bold,
    TextStyle? subtitle24Medium,
    TextStyle? subtitle24Bold,
    TextStyle? subtitle20Medium,
    TextStyle? subtitle20Bold,
    TextStyle? subtitle16Medium,
    TextStyle? subtitle16Bold,
    TextStyle? description16Regular,
    TextStyle? description16Medium,
    TextStyle? description14Regular,
    TextStyle? description14Medium,
    TextStyle? description14Bold,
    TextStyle? description12Regular,
    TextStyle? description12Medium,
    TextStyle? description12Bold,
    TextStyle? button2XLarge,
    TextStyle? buttonXLarge,
    TextStyle? buttonLarge,
    TextStyle? buttonMedium,
    TextStyle? buttonSmall,
    TextStyle? inputPlaceHolder,
    TextStyle? inputLabel,
    TextStyle? inputHint,
    TextStyle? navigationItemStyle,
    TextStyle? massText20Regular,
    TextStyle? massText16Regular,
  }) {
    return AppTypography(
      title40Medium: title40Medium ?? this.title40Medium,
      title40Bold: title40Bold ?? this.title40Bold,
      title32Medium: title32Medium ?? this.title32Medium,
      title32Bold: title32Bold ?? this.title32Bold,
      title24Medium: title24Medium ?? this.title24Medium,
      title24Bold: title24Bold ?? this.title24Bold,
      subtitle24Medium: subtitle24Medium ?? this.subtitle24Medium,
      subtitle24Bold: subtitle24Bold ?? this.subtitle24Bold,
      subtitle20Medium: subtitle20Medium ?? this.subtitle20Medium,
      subtitle20Bold: subtitle20Bold ?? this.subtitle20Bold,
      subtitle16Medium: subtitle16Medium ?? this.subtitle16Medium,
      subtitle16Bold: subtitle16Bold ?? this.subtitle16Bold,
      description16Regular: description16Regular ?? this.description16Regular,
      description16Medium: description16Medium ?? this.description16Medium,
      description14Regular: description14Regular ?? this.description14Regular,
      description14Medium: description14Medium ?? this.description14Medium,
      description14Bold: description14Bold ?? this.description14Bold,
      description12Regular: description12Regular ?? this.description12Regular,
      description12Medium: description12Medium ?? this.description12Medium,
      description12Bold: description12Bold ?? this.description12Bold,
      button2XLarge: button2XLarge ?? this.button2XLarge,
      buttonXLarge: buttonXLarge ?? this.buttonXLarge,
      buttonLarge: buttonLarge ?? this.buttonLarge,
      buttonMedium: buttonMedium ?? this.buttonMedium,
      buttonSmall: buttonSmall ?? this.buttonSmall,
      inputPlaceHolder: inputPlaceHolder ?? this.inputPlaceHolder,
      inputLabel: inputLabel ?? this.inputLabel,
      inputHint: inputHint ?? this.inputHint,
      navigationItemStyle: navigationItemStyle ?? this.navigationItemStyle,
      massText20Regular: massText20Regular ?? this.massText20Regular,
      massText16Regular: massText16Regular ?? this.massText16Regular,
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

    // return AppTypography(
    //   title40Medium: TextStyle.lerp(title40Medium, other.title40Medium, t)!,
    // );
    return AppTypography(
      title40Medium: TextStyle.lerp(title40Medium, other.title40Medium, t)!,
      title40Bold: TextStyle.lerp(title40Bold, other.title40Bold, t)!,
      title32Medium: TextStyle.lerp(title32Medium, other.title32Medium, t)!,
      title32Bold: TextStyle.lerp(title32Bold, other.title32Bold, t)!,
      title24Medium: TextStyle.lerp(title24Medium, other.title24Medium, t)!,
      title24Bold: TextStyle.lerp(title24Bold, other.title24Bold, t)!,
      subtitle24Medium:
          TextStyle.lerp(subtitle24Medium, other.subtitle24Medium, t)!,
      subtitle24Bold: TextStyle.lerp(subtitle24Bold, other.subtitle24Bold, t)!,
      subtitle20Medium:
          TextStyle.lerp(subtitle20Medium, other.subtitle20Medium, t)!,
      subtitle20Bold: TextStyle.lerp(subtitle20Bold, other.subtitle20Bold, t)!,
      subtitle16Medium:
          TextStyle.lerp(subtitle16Medium, other.subtitle16Medium, t)!,
      subtitle16Bold: TextStyle.lerp(subtitle16Bold, other.subtitle16Bold, t)!,
      description16Regular:
          TextStyle.lerp(description16Regular, other.description16Regular, t)!,
      description16Medium:
          TextStyle.lerp(description16Medium, other.description16Medium, t)!,
      description14Regular:
          TextStyle.lerp(description14Regular, other.description14Regular, t)!,
      description14Medium:
          TextStyle.lerp(description14Medium, other.description14Medium, t)!,
      description14Bold:
          TextStyle.lerp(description14Bold, other.description14Bold, t)!,
      description12Regular:
          TextStyle.lerp(description12Regular, other.description12Regular, t)!,
      description12Medium:
          TextStyle.lerp(description12Medium, other.description12Medium, t)!,
      description12Bold:
          TextStyle.lerp(description12Bold, other.description12Bold, t)!,
      button2XLarge: TextStyle.lerp(button2XLarge, other.button2XLarge, t)!,
      buttonXLarge: TextStyle.lerp(buttonXLarge, other.buttonXLarge, t)!,
      buttonLarge: TextStyle.lerp(buttonLarge, other.buttonLarge, t)!,
      buttonMedium: TextStyle.lerp(buttonMedium, other.buttonMedium, t)!,
      buttonSmall: TextStyle.lerp(buttonSmall, other.buttonSmall, t)!,
      inputPlaceHolder:
          TextStyle.lerp(inputPlaceHolder, other.inputPlaceHolder, t)!,
      inputLabel: TextStyle.lerp(inputLabel, other.inputLabel, t)!,
      inputHint: TextStyle.lerp(inputHint, other.inputHint, t)!,
      navigationItemStyle: TextStyle.lerp(
        navigationItemStyle,
        other.navigationItemStyle,
        t,
      )!,
      massText20Regular:
          TextStyle.lerp(massText20Regular, other.massText20Regular, t)!,
      massText16Regular:
          TextStyle.lerp(massText16Regular, other.massText16Regular, t)!,
    );
  }
}

/// {@macro app_typography}
class AppRegularTypography extends AppTypography {
  /// {@macro app_typography}
  AppRegularTypography({
    super.title40Medium = const TextStyle(
      fontSize: 40,
      height: 48 / 40,
      fontWeight: FontWeight.w500,
    ),
    super.title40Bold = const TextStyle(
      fontSize: 40,
      height: 48 / 40,
      fontWeight: FontWeight.w700,
    ),
    super.title32Medium = const TextStyle(
      fontSize: 32,
      height: 40 / 32,
      fontWeight: FontWeight.w500,
    ),
    super.title32Bold = const TextStyle(
      fontSize: 32,
      height: 40 / 32,
      fontWeight: FontWeight.w700,
    ),
    super.title24Medium = const TextStyle(
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w500,
    ),
    super.title24Bold = const TextStyle(
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w700,
    ),
    super.subtitle24Medium = const TextStyle(
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w500,
    ),
    super.subtitle24Bold = const TextStyle(
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w700,
    ),
    super.subtitle20Medium = const TextStyle(
      fontSize: 20,
      height: 24 / 20,
      fontWeight: FontWeight.w500,
    ),
    super.subtitle20Bold = const TextStyle(
      fontSize: 20,
      height: 24 / 20,
      fontWeight: FontWeight.w700,
    ),
    super.subtitle16Medium = const TextStyle(
      fontSize: 16,
      height: 20 / 16,
      fontWeight: FontWeight.w500,
    ),
    super.subtitle16Bold = const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w700,
    ),
    super.description16Regular = const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w400,
    ),
    super.description16Medium = const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w500,
    ),
    super.description14Regular = const TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w400,
    ),
    super.description14Medium = const TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
    ),
    super.description14Bold = const TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w700,
    ),
    super.description12Regular = const TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w400,
    ),
    super.description12Medium = const TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w500,
    ),
    super.description12Bold = const TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w700,
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
    super.inputLabel = const TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w400,
    ),
    super.inputHint = const TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w400,
    ),
    super.navigationItemStyle = const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w500,
    ),
    super.massText20Regular = const TextStyle(
      fontSize: 20,
      height: 24 / 20,
      fontWeight: FontWeight.w400,
    ),
    super.massText16Regular = const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w400,
    ),
  });
}
