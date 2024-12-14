import 'package:flutter/material.dart';
import 'package:next_design_system/src/core/extensions/theme_ext.dart';

import 'base_app_text_button.dart';

/// {@template link_text_button}
/// A custom link text button widget that adapts to the platform.
/// {@endtemplate}
class LinkTextButton extends AppTextButton {
  /// {@macro link_text_button}
  const LinkTextButton({
    super.key,
    required super.label,
    super.onTap,
    super.leading,
    super.trailing,
    super.appButtonSize,
  });

  @override
  Color backgroundColor(BuildContext context) {
    return context.buttonTheme.linkDefault;
  }

  @override
  Color disabledColor(BuildContext context) {
    return context.buttonTheme.linkDisabled;
  }

  @override
  Color focusColor(BuildContext context) {
    return context.buttonTheme.linkFocused;
  }

  @override
  Color textColor(BuildContext context) {
    return context.buttonTheme.linkText;
  }
}
