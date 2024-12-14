import 'package:flutter/material.dart';
import 'package:next_design_system/src/core/extensions/theme_ext.dart';

import '../../../atoms/app_radius.dart';
import '../../../atoms/app_spacing.dart';
import '../../../core/icon_builder.dart';
import '../app_button_size.dart';

/// {@template app_text_button}
/// A custom text button widget that adapts to the platform.
/// {@endtemplate}
abstract class AppTextButton extends StatelessWidget {
  /// {@macro app_text_button}
  const AppTextButton({
    super.key,
    required this.label,
    this.onTap,
    this.leading,
    this.trailing,
    this.appButtonSize = AppButtonSize.medium,
  });

  /// The label for the text button.
  final String label;

  /// The callback function for the text button.
  final VoidCallback? onTap;

  /// The leading icon for the text button.
  final IconBuilder? leading;

  /// The trailing icon for the text button.
  final IconBuilder? trailing;

  /// The size of the text button.
  final AppButtonSize appButtonSize;

  /// The background color for the text button.
  Color backgroundColor(BuildContext context);

  /// The focus color for the text button.
  Color focusColor(BuildContext context);

  /// The hover color for the text button.
  Color hoverColor(BuildContext context);

  /// The disabled color for the text button.
  Color disabledColor(BuildContext context);

  /// The text color for the text button.
  Color textColor(BuildContext context);

  /// The disabled text color for the text button.
  Color disabledTextColor(BuildContext context) {
    return context.buttonTheme.primaryTextDisabled;
  }

  /// The default border for the text button.
  BorderSide defaultBorder(BuildContext context) => BorderSide.none;

  /// The focused border for the text button.
  BorderSide focusedBorder(BuildContext context) => BorderSide.none;

  /// The hover border for the text button.
  BorderSide hoverBorder(BuildContext context) => BorderSide.none;

  /// The disabled border for the text button.
  BorderSide disabledBorder(BuildContext context) => BorderSide.none;

  @override
  Widget build(BuildContext context) {
    final betweenSpace = switch (appButtonSize) {
      AppButtonSize.small ||
      AppButtonSize.xSmall ||
      AppButtonSize.medium =>
        AppSpacing.xs,
      AppButtonSize.large || AppButtonSize.xlarge => AppSpacing.sm,
      AppButtonSize.xxLarge => AppSpacing.lg,
    };

    final inputTextColor = WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return disabledTextColor(context);
        }

        return textColor(context);
      },
    );

    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return disabledColor(context);
            }

            if (states.contains(WidgetState.hovered)) {
              return hoverColor(context);
            }

            if (states.contains(WidgetState.focused)) {
              return focusColor(context);
            }

            if (states.contains(WidgetState.pressed)) {
              return focusColor(context);
            }

            return backgroundColor(context);
          },
        ),
        shape: WidgetStateProperty.resolveWith(
          (states) {
            const shape = RoundedRectangleBorder(
              borderRadius: BorderRadius.all(AppRadius.md),
            );

            if (states.contains(WidgetState.disabled)) {
              return shape.copyWith(side: disabledBorder(context));
            }

            if (states.contains(WidgetState.focused)) {
              return shape.copyWith(side: focusedBorder(context));
            }

            if (states.contains(WidgetState.hovered)) {
              return shape.copyWith(side: hoverBorder(context));
            }

            if (states.contains(WidgetState.pressed)) {
              return shape.copyWith(side: focusedBorder(context));
            }

            return shape.copyWith(side: defaultBorder(context));
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return disabledColor(context);
            }

            if (states.contains(WidgetState.hovered)) {
              return hoverColor(context);
            }

            if (states.contains(WidgetState.focused)) {
              return focusColor(context);
            }

            if (states.contains(WidgetState.pressed)) {
              return focusColor(context);
            }

            return backgroundColor(context);
          },
        ),
        foregroundColor: inputTextColor,
        fixedSize: WidgetStateProperty.all(
          switch (appButtonSize) {
            AppButtonSize.small ||
            AppButtonSize.xSmall =>
              const Size(double.infinity, 36),
            AppButtonSize.medium => const Size(double.infinity, 40),
            AppButtonSize.large => const Size(double.infinity, 44),
            AppButtonSize.xlarge => const Size(double.infinity, 48),
            AppButtonSize.xxLarge => const Size(double.infinity, 56),
          },
        ),
        padding: WidgetStateProperty.all(
          switch (appButtonSize) {
            AppButtonSize.small ||
            AppButtonSize.xSmall =>
              const EdgeInsets.symmetric(horizontal: 12),
            AppButtonSize.medium => const EdgeInsets.symmetric(horizontal: 16),
            AppButtonSize.large => const EdgeInsets.symmetric(horizontal: 16),
            AppButtonSize.xlarge => const EdgeInsets.symmetric(horizontal: 20),
            AppButtonSize.xxLarge => const EdgeInsets.symmetric(horizontal: 24),
          },
        ),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            leading!(
              onTap != null ? textColor(context) : disabledTextColor(context),
            ),
            SizedBox(width: betweenSpace),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
            child: Text(
              label,
              style: switch (appButtonSize) {
                AppButtonSize.small ||
                AppButtonSize.xSmall =>
                  context.typography.buttonSmall,
                AppButtonSize.medium => context.typography.buttonMedium,
                AppButtonSize.large => context.typography.buttonLarge,
                AppButtonSize.xlarge => context.typography.buttonXLarge,
                AppButtonSize.xxLarge => context.typography.button2XLarge,
              },
            ),
          ),
          if (trailing != null) ...[
            SizedBox(width: betweenSpace),
            trailing!(
              onTap != null ? textColor(context) : disabledTextColor(context),
            ),
          ],
        ],
      ),
    );
  }
}
