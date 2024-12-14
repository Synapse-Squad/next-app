import 'package:flutter/material.dart';
import 'package:next_design_system/src/core/extensions/theme_ext.dart';

import 'base_app_text_button.dart';

/// {@template outline_text_button}
/// A custom outline text button widget that adapts to the platform.
/// {@endtemplate}
class OutlineTextButton extends AppTextButton {
  /// {@macro outline_text_button}
  const OutlineTextButton({
    super.key,
    required super.label,
    super.onTap,
    super.leading,
    super.trailing,
    super.appButtonSize,
  });

  @override
  Color backgroundColor(BuildContext context) {
    return context.buttonTheme.outlinedDefault;
  }

  @override
  Color disabledColor(BuildContext context) {
    return context.buttonTheme.outlinedDisabled;
  }

  @override
  Color focusColor(BuildContext context) {
    return context.buttonTheme.outlinedFocused;
  }

  @override
  Color textColor(BuildContext context) {
    return context.buttonTheme.buttonLineDefault;
  }

  @override
  BorderSide defaultBorder(BuildContext context) {
    return BorderSide(
      color: context.buttonTheme.buttonLineDefault,
    );
  }

  @override
  BorderSide focusedBorder(BuildContext context) {
    return BorderSide(
      color: context.buttonTheme.buttonLineDefault,
    );
  }

  @override
  BorderSide hoverBorder(BuildContext context) {
    return BorderSide(
      color: context.buttonTheme.buttonLineDefault,
    );
  }

  @override
  BorderSide disabledBorder(BuildContext context) {
    return BorderSide(
      color: context.buttonTheme.outlinedBorderDisabled,
    );
  }
}
