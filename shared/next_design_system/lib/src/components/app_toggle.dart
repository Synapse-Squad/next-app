import 'package:flutter/material.dart';
import 'package:next_design_system/src/core/extensions/theme_ext.dart';

/// {@template app_toggle}
/// A custom toggle switch widget that adapts to the platform.
/// {@endtemplate}
class AppToggle extends StatefulWidget {
  /// {@macro app_toggle}
  const AppToggle({
    super.key,
    this.value = false,
    required this.onChanged,
  });

  /// The current value of the toggle.
  final bool value;

  /// Called when the toggle state changes.
  final ValueChanged<bool> onChanged;

  @override
  AppToggleState createState() => AppToggleState();
}

/// The state for the [AppToggle] widget.
class AppToggleState extends State<AppToggle> {
  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: widget.value,
      onChanged: widget.onChanged,
      activeColor: context.toggleTheme.activeColor,
      inactiveThumbColor: context.toggleTheme.inactiveThumbColor,
      activeTrackColor: context.toggleTheme.enabledTrackColor,
      inactiveTrackColor: context.toggleTheme.disabledTrackColor,
    );
  }
}
