import 'package:flutter/material.dart';

import '../atoms/app_colors.dart';

/// {@template app_input_theme}
/// Theme class which provides configuration of [AppTextField]
/// {@endtemplate}
class AppInputTheme extends ThemeExtension<AppInputTheme> {
  /// {@macro app_input_theme}
  const AppInputTheme({
    required this.textColor,
    required this.errorTextColor,
    required this.disabledTextColor,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    required this.disabledBorderColor,
    required this.defaultColor,
    required this.disabledColor,
    required this.cursorColor,
    required this.hintTextColor,
  });

  /// {@macro app_input_theme}
  factory AppInputTheme.light() {
    return AppInputTheme(
      textColor: AppColors.black,
      errorTextColor: AppColors.error.shade400,
      disabledTextColor: AppColors.lightGray,
      borderColor: AppColors.darkGray,
      focusedBorderColor: AppColors.brand,
      errorBorderColor: AppColors.error.shade400,
      disabledBorderColor: AppColors.lightGray,
      defaultColor: AppColors.black,
      disabledColor: AppColors.transparent,
      cursorColor: AppColors.brand,
      hintTextColor: AppColors.darkGray,
    );
  }

  /// {@macro app_input_theme}
  factory AppInputTheme.dark() {
    return AppInputTheme(
      textColor: AppColors.white,
      errorTextColor: AppColors.error.shade400,
      disabledTextColor: AppColors.lightGray,
      borderColor: AppColors.darkGray,
      focusedBorderColor: AppColors.brand,
      errorBorderColor: AppColors.error.shade400,
      disabledBorderColor: AppColors.lightGray,
      defaultColor: AppColors.black,
      disabledColor: AppColors.transparent,
      cursorColor: AppColors.brand,
      hintTextColor: AppColors.darkGray,
    );
  }

  /// The default text color.
  final Color textColor;

  /// The text color when error.
  final Color errorTextColor;

  /// The text color when disabled.
  final Color disabledTextColor;

  /// The default border color.
  final Color borderColor;

  /// The border color when focused.
  final Color focusedBorderColor;

  /// The border color when error.
  final Color errorBorderColor;

  /// The border color when disabled.
  final Color disabledBorderColor;

  /// The default color.
  final Color defaultColor;

  /// The disabled color.
  final Color disabledColor;

  /// The cursor color for text field
  final Color cursorColor;

  /// The color for hint text
  final Color hintTextColor;

  @override
  ThemeExtension<AppInputTheme> copyWith({
    Color? textColor,
    Color? errorTextColor,
    Color? disabledTextColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? disabledBorderColor,
    Color? defaultColor,
    Color? disabledTrackColor,
    Color? cursorColor,
    Color? hintTextColor,
  }) {
    return AppInputTheme(
      textColor: textColor ?? this.textColor,
      errorTextColor: errorTextColor ?? this.errorTextColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      defaultColor: defaultColor ?? this.defaultColor,
      disabledColor: disabledTrackColor ?? this.disabledColor,
      cursorColor: cursorColor ?? this.cursorColor,
      hintTextColor: hintTextColor ?? this.hintTextColor,
    );
  }

  @override
  ThemeExtension<AppInputTheme> lerp(
    covariant ThemeExtension<AppInputTheme>? other,
    double t,
  ) {
    if (other is! AppInputTheme) {
      return this;
    }

    return AppInputTheme(
      textColor: Color.lerp(textColor, other.textColor, t)!,
      errorTextColor: Color.lerp(
        errorTextColor,
        other.errorTextColor,
        t,
      )!,
      disabledTextColor:
          Color.lerp(disabledTextColor, other.disabledTextColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      focusedBorderColor: Color.lerp(
        focusedBorderColor,
        other.focusedBorderColor,
        t,
      )!,
      errorBorderColor: Color.lerp(
        errorBorderColor,
        other.errorBorderColor,
        t,
      )!,
      disabledBorderColor:
          Color.lerp(disabledBorderColor, other.disabledBorderColor, t)!,
      defaultColor: Color.lerp(defaultColor, other.defaultColor, t)!,
      disabledColor: Color.lerp(disabledColor, other.disabledColor, t)!,
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t)!,
      hintTextColor: Color.lerp(hintTextColor, other.hintTextColor, t)!,
    );
  }
}
