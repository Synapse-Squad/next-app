import 'package:flutter/material.dart';
import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppCheckbox',
  type: AppCheckbox,
  designLink: '',
)
Widget appSwitchUseCase(BuildContext context) {
  final checkedKnob = context.knobs.boolean(
    label: 'Checked',
    initialValue: true,
  );

  final enabledKnob = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  return Scaffold(
    body: Center(
      child: AppCheckbox(
        onChanged: (_) {},
        value: checkedKnob,
        enabled: enabledKnob,
      ),
    ),
  );
}
