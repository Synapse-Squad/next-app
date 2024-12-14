import 'package:flutter/material.dart';

import '../../themes/app_badge_theme.dart';
import '../../themes/app_button_theme.dart';
import '../../themes/app_checkbox_theme.dart';
import '../../themes/app_dropdown_theme.dart';
import '../../themes/app_icon_theme.dart';
import '../../themes/app_input_theme.dart';
import '../../themes/app_layout_theme.dart';
import '../../themes/app_theme.dart';
import '../../themes/app_toggle_theme.dart';
import '../../themes/app_typography.dart';
import '../../themes/app_typography_theme.dart';

/// An extension on [BuildContext] that provides access to the current theme.
extension ThemeExt on BuildContext {
  /// The current theme.
  ThemeData get theme => Theme.of(this);

  ///the current button theme
  AppButtonTheme get buttonTheme =>
      theme.extension<AppTheme>()!.appButtonTheme as AppButtonTheme;

  /// The current app typographyTheme.
  AppTypographyTheme get typographyTheme =>
      theme.extension<AppTheme>()!.appTypographyTheme as AppTypographyTheme;

  /// The current app typography.
  AppTypography get typography =>
      theme.extension<AppTheme>()!.appTypography as AppTypography;

  /// The current app checkboxTheme.
  AppCheckboxTheme get checkboxTheme =>
      theme.extension<AppTheme>()!.appCheckboxTheme as AppCheckboxTheme;

  /// The current app iconTheme.
  AppIconTheme get iconTheme =>
      theme.extension<AppTheme>()!.appIconTheme as AppIconTheme;

  /// The current app toggleTheme.
  AppToggleTheme get toggleTheme =>
      theme.extension<AppTheme>()!.appToggleTheme as AppToggleTheme;

  /// The current app appDropdownTheme.
  AppDropdownTheme get appDropdownTheme =>
      theme.extension<AppTheme>()!.appDropdownTheme as AppDropdownTheme;

  /// The current app inputTheme.
  AppInputTheme get inputTheme =>
      theme.extension<AppTheme>()!.appInputTheme as AppInputTheme;

  /// The current app layoutTheme.
  AppLayoutTheme get layoutTheme =>
      theme.extension<AppTheme>()!.appLayoutTheme as AppLayoutTheme;

  /// The current app badgeTheme.
  AppBadgeTheme get badgeTheme =>
      theme.extension<AppTheme>()!.appBadgeTheme as AppBadgeTheme;
}
