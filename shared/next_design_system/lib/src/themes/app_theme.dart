import 'package:flutter/material.dart';

import 'app_badge_theme.dart';
import 'app_button_theme.dart';
import 'app_checkbox_theme.dart';
import 'app_dropdown_theme.dart';
import 'app_icon_theme.dart';
import 'app_input_theme.dart';
import 'app_layout_theme.dart';
import 'app_toggle_theme.dart';
import 'app_typography.dart';
import 'app_typography_theme.dart';

/// {@template app_theme}
/// Configuration class which collects all Themes of app together and provides
/// them as a single instance
/// {@endtemplate}
class AppTheme extends ThemeExtension<AppTheme> {
  /// {@macro app_theme}
  const AppTheme({
    required this.appButtonTheme,
    required this.appCheckboxTheme,
    required this.appIconTheme,
    required this.appToggleTheme,
    required this.appTypographyTheme,
    required this.appTypography,
    required this.appDropdownTheme,
    required this.appInputTheme,
    required this.appLayoutTheme,
    required this.appBadgeTheme,
  });

  /// {@macro app_theme}
  factory AppTheme.light() {
    return AppTheme(
      appButtonTheme: AppButtonTheme.light(),
      appCheckboxTheme: AppCheckboxTheme.light(),
      appIconTheme: AppIconTheme.light(),
      appToggleTheme: AppToggleTheme.light(),
      appTypographyTheme: AppTypographyTheme.light(),
      appTypography: AppRegularTypography(),
      appDropdownTheme: AppDropdownTheme.light(),
      appInputTheme: AppInputTheme.light(),
      appLayoutTheme: AppLayoutTheme.light(),
      appBadgeTheme: AppBadgeTheme.light(),
    );
  }

  /// {@macro app_theme}
  factory AppTheme.dark() {
    return AppTheme(
      appButtonTheme: AppButtonTheme.light(),
      appCheckboxTheme: AppCheckboxTheme.light(),
      appIconTheme: AppIconTheme.light(),
      appToggleTheme: AppToggleTheme.light(),
      appTypographyTheme: AppTypographyTheme.light(),
      appTypography: AppRegularTypography(),
      appDropdownTheme: AppDropdownTheme.light(),
      appInputTheme: AppInputTheme.dark(),
      appLayoutTheme: AppLayoutTheme.light(),
      appBadgeTheme: AppBadgeTheme.light(),
    );
  }

  /// [AppButtonTheme] instance provides configuration of buttons
  final ThemeExtension<AppButtonTheme> appButtonTheme;

  /// [AppCheckboxTheme] instance provides configuration of [AppCheckbox]
  final ThemeExtension<AppCheckboxTheme> appCheckboxTheme;

  /// [AppIconTheme] instance provides configuration of icons
  final ThemeExtension<AppIconTheme> appIconTheme;

  /// [AppToggleTheme] instance provides configuration of [AppToggle]
  final ThemeExtension<AppToggleTheme> appToggleTheme;

  /// [AppTypographyTheme] instance provides configuration for [TextStyle]
  final ThemeExtension<AppTypographyTheme> appTypographyTheme;

  /// [AppTypography] instance provides configuration for [TextStyle]
  final ThemeExtension<AppTypography> appTypography;

  /// [AppDropdownTheme] instance provides configuration of dropdown
  final ThemeExtension<AppDropdownTheme> appDropdownTheme;

  /// [AppInputTheme] instance provides configuration of [AppTextField]
  final ThemeExtension<AppInputTheme> appInputTheme;

  /// [AppLayoutTheme] instance provides configuration of layout
  final ThemeExtension<AppLayoutTheme> appLayoutTheme;

  /// [AppBadgeTheme] instance provides configuration of badge
  final ThemeExtension<AppBadgeTheme> appBadgeTheme;

  @override
  ThemeExtension<AppTheme> copyWith({
    ThemeExtension<AppButtonTheme>? appButtonTheme,
    ThemeExtension<AppCheckboxTheme>? appCheckboxTheme,
    ThemeExtension<AppIconTheme>? appIconTheme,
    ThemeExtension<AppToggleTheme>? appToggleTheme,
    ThemeExtension<AppTypographyTheme>? appTypographyTheme,
    AppTypography? appTypography,
    ThemeExtension<AppDropdownTheme>? appDropdownTheme,
    ThemeExtension<AppInputTheme>? appInputTheme,
    ThemeExtension<AppLayoutTheme>? appLayoutTheme,
    ThemeExtension<AppBadgeTheme>? appBadgeTheme,
  }) {
    return AppTheme(
      appButtonTheme: appButtonTheme ?? this.appButtonTheme,
      appCheckboxTheme: appCheckboxTheme ?? this.appCheckboxTheme,
      appIconTheme: appIconTheme ?? this.appIconTheme,
      appToggleTheme: appToggleTheme ?? this.appToggleTheme,
      appTypographyTheme: appTypographyTheme ?? this.appTypographyTheme,
      appTypography: appTypography ?? this.appTypography,
      appDropdownTheme: appDropdownTheme ?? this.appDropdownTheme,
      appInputTheme: appInputTheme ?? this.appInputTheme,
      appLayoutTheme: appLayoutTheme ?? this.appLayoutTheme,
      appBadgeTheme: appBadgeTheme ?? this.appBadgeTheme,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme(
      appButtonTheme: appButtonTheme.lerp(other.appButtonTheme, t),
      appCheckboxTheme: appCheckboxTheme.lerp(other.appCheckboxTheme, t),
      appIconTheme: appIconTheme.lerp(other.appIconTheme, t),
      appToggleTheme: appToggleTheme.lerp(other.appToggleTheme, t),
      appTypographyTheme: appTypographyTheme.lerp(other.appTypographyTheme, t),
      appTypography: appTypography.lerp(other.appTypography, t),
      appDropdownTheme: appDropdownTheme.lerp(other.appDropdownTheme, t),
      appInputTheme: appInputTheme.lerp(other.appInputTheme, t),
      appLayoutTheme: appLayoutTheme.lerp(other.appLayoutTheme, t),
      appBadgeTheme: appBadgeTheme.lerp(other.appBadgeTheme, t),
    );
  }
}
