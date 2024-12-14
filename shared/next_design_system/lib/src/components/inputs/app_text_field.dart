import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_design_system/src/core/extensions/theme_ext.dart';

import '../../atoms/app_colors.dart';

/// {@template app_text_field}
/// A customizable text field widget with various customization options.
/// {@endtemplate}
class AppTextField extends StatelessWidget {
  /// {@macro app_text_field}
  const AppTextField({
    super.key,
    this.controller,
    this.enabled = true,
    this.obscureText = false,
    this.onChanged,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.hintText,
    this.errorText,
    this.suffixIcon,
    this.suffixIconConstraints =
        const BoxConstraints(minHeight: 24, minWidth: 40),
    this.prefixIcon,
    this.prefixIconConstraints =
        const BoxConstraints(minHeight: 24, minWidth: 40),
    this.autofillHints,
    this.onEditingComplete,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
  });

  /// The controller for the text field.
  final TextEditingController? controller;

  /// Whether the text field is enabled.
  final bool enabled;

  /// Whether the text field is obscured.
  final bool obscureText;

  /// Called when the text field value changes.
  final ValueChanged<String>? onChanged;

  /// The auto validate mode for the text field.
  final AutovalidateMode autoValidateMode;

  /// The validator for the text field.
  final FormFieldValidator<String>? validator;

  /// The helper text for the text field.
  final String? hintText;

  /// The error text for the text field.
  final String? errorText;

  /// The suffix icon for the text field.
  final Widget? suffixIcon;

  /// The constraints for the suffix icon.
  final BoxConstraints? suffixIconConstraints;

  /// The prefix icon for the text field.
  final Widget? prefixIcon;

  /// The constraints for the prefix icon.
  final BoxConstraints? prefixIconConstraints;

  /// The auto fill hints for app text field.
  final Iterable<String>? autofillHints;

  /// Called when the text field value completed.
  final VoidCallback? onEditingComplete;

  /// The input formatters for the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// The keyboard type for the text field.
  final TextInputType? keyboardType;

  /// the maximum lines available in text field.
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onEditingComplete: onEditingComplete,
      autofillHints: autofillHints,
      controller: controller,
      enabled: enabled,
      obscureText: obscureText,
      onChanged: onChanged,
      autovalidateMode: autoValidateMode,
      validator: validator,
      maxLines: maxLines,
      style: WidgetStateTextStyle.resolveWith(
        (states) {
          late final Color textColor;

          if (states.contains(WidgetState.disabled)) {
            textColor = context.inputTheme.disabledTextColor;
          } else {
            textColor = context.inputTheme.textColor;
          }

          return context.typography.inputPlaceHolder.copyWith(
            color: textColor,
          );
        },
      ),
      cursorColor: context.inputTheme.cursorColor,
      cursorHeight: 16,
      decoration: InputDecoration(
        border: MaterialStateOutlineInputBorder.resolveWith(
          (states) {
            late final Color borderColor;
            var borderWidth = 1.0;

            if (states.contains(WidgetState.focused)) {
              borderColor = context.inputTheme.focusedBorderColor;
              borderWidth = 2.0;
            } else if (states.contains(WidgetState.disabled)) {
              borderColor = context.inputTheme.disabledBorderColor;
            } else if (states.contains(WidgetState.error)) {
              borderWidth = 2.0;
              borderColor = context.inputTheme.errorBorderColor;
            } else {
              borderColor = context.inputTheme.borderColor;
            }

            return UnderlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
            );
          },
        ),
        filled: true,
        fillColor:
            enabled ? AppColors.transparent : context.inputTheme.disabledColor,
        hoverColor: AppColors.transparent,
        focusColor: AppColors.transparent,
        hintText: hintText,
        hintStyle: WidgetStateTextStyle.resolveWith(
          (states) {
            late final Color textColor;

            if (states.contains(WidgetState.disabled)) {
              textColor = context.inputTheme.disabledTextColor;
            } else {
              textColor = context.inputTheme.hintTextColor;
            }

            return context.typography.inputHint.copyWith(
              color: textColor,
            );
          },
        ),
        errorText: errorText,
        errorStyle: context.typography.inputHint.copyWith(
          color: context.inputTheme.errorTextColor,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconConstraints: suffixIconConstraints,
        prefixIconConstraints: prefixIconConstraints,
      ),
    );
  }
}
