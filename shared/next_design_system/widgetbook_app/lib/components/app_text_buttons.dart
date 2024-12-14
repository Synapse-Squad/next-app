import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_app/knob/button_size_knob.dart';

@widgetbook.UseCase(
  name: 'Text Buttons',
  type: AppTextButton,
  designLink: '',
)
Widget textButtonsUseCase(BuildContext context) {
  final labelKnob = context.knobs.string(
    label: 'Button Title',
    initialValue: 'Button',
  );

  final buttonSizeKnob = context.knobs.buttonSize(label: 'Button Size');

  final enabledKnob = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  final buttonCallback = enabledKnob ? () {} : null;

  final showLeadingKnob = context.knobs.boolean(
    label: 'Show Leading',
    initialValue: true,
  );
  final showTrailingKnob = context.knobs.boolean(
    label: 'Show Trailing',
    initialValue: true,
  );

  final leading = showLeadingKnob
      ? (Color color) {
          return Icon(
            CupertinoIcons.chevron_back,
            size: 20,
            color: color,
          );
        }
      : null;
  final trailing = showTrailingKnob
      ? (Color color) {
          return Icon(
            CupertinoIcons.chevron_forward,
            size: 20,
            color: color,
          );
        }
      : null;

  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryTextButton(
            label: labelKnob,
            appButtonSize: buttonSizeKnob,
            onTap: buttonCallback,
            leading: leading,
            trailing: trailing,
          ),
          const SizedBox(height: 8),
          OutlineTextButton(
            label: labelKnob,
            appButtonSize: buttonSizeKnob,
            onTap: buttonCallback,
            leading: leading,
            trailing: trailing,
          ),
          const SizedBox(height: 8),
          LinkTextButton(
            label: labelKnob,
            appButtonSize: buttonSizeKnob,
            onTap: buttonCallback,
            leading: leading,
            trailing: trailing,
          ),
        ],
      ),
    ),
  );
}
