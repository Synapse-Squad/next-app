import 'package:flutter/material.dart';
import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppToggle',
  type: AppToggle,
  designLink: '',
)
Widget appToggleUseCase(BuildContext context) {
  final checkedKnob = context.knobs.boolean(
    label: 'Checked',
    initialValue: true,
  );

  return Scaffold(
    body: Center(
      child: AppToggle(
        onChanged: (_) {},
        value: checkedKnob,
      ),
    ),
  );
}
