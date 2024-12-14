import 'package:flutter/material.dart';
import 'package:next_design_system/src/core/extensions/theme_ext.dart';

import '../atoms/app_radius.dart';

/// {@template app_checkbox}
/// A customizable checkbox widget with active, disabled, and hover states.
/// {@endtemplate}
class AppCheckbox extends StatefulWidget {
  ///{@macro app_checkbox}
  const AppCheckbox({
    super.key,
    this.value = false,
    this.onChanged,
    this.enabled = true,
  });

  /// The current value of the checkbox.
  final bool value;

  /// Called when the checkbox state changes.
  final ValueChanged<bool?>? onChanged;

  /// The checkbox is enabled.
  final bool enabled;

  @override
  AppCheckboxState createState() => AppCheckboxState();
}

/// The state for [AppCheckbox].
class AppCheckboxState extends State<AppCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          widget.enabled ? () => widget.onChanged?.call(!widget.value) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: switch (widget.enabled) {
            false => context.checkboxTheme.disabledColor,
            _ => widget.value
                ? context.checkboxTheme.enabledColor
                : Colors.transparent,
          },
          border: Border.all(
            color: switch (widget.enabled) {
              false => context.checkboxTheme.disabledBorderColor,
              _ => widget.value
                  ? context.checkboxTheme.enabledColor
                  : context.checkboxTheme.borderColor,
            },
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(AppRadius.xs),
        ),
        width: 19,
        height: 19,
        child: Center(
          child: widget.value && widget.enabled
              ? Icon(
                  Icons.check_rounded,
                  color: context.iconTheme.white,
                  size: 14,
                )
              : null,
        ),
      ),
    );
  }
}
