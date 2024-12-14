import 'package:flutter/material.dart';
import 'package:next_design_system/src/core/extensions/theme_ext.dart';

import '../../../atoms/app_radius.dart';

class AppDropdownPopup extends StatefulWidget {
  const AppDropdownPopup({
    super.key,
    required this.builder,
    required this.constraints,
  });

  final WidgetBuilder builder;
  final BoxConstraints constraints;

  @override
  State<AppDropdownPopup> createState() => _AppDropdownPopupState();
}

class _AppDropdownPopupState extends State<AppDropdownPopup> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.constraints.maxWidth,
      height: widget.constraints.maxHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(AppRadius.md),
          color: context.layoutTheme.sidebarBackground,
          border: Border.all(color: context.layoutTheme.sidebarBorder),
          boxShadow: const [
            BoxShadow(
              color: Color(0x07101828),
              blurRadius: 6,
              offset: Offset(0, 4),
              spreadRadius: -2,
            ),
            BoxShadow(
              color: Color(0x14101828),
              blurRadius: 16,
              offset: Offset(0, 12),
              spreadRadius: -4,
            ),
          ],
        ),
        child: widget.builder(context),
      ),
    );
  }
}
