import 'package:flutter/material.dart';
import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppTextField',
  type: AppTextField,
  designLink: '',
)
Widget appTextFieldUseCase(BuildContext context) {
  final controller = TextEditingController();

  final enabledKnob = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  final labelKnob = context.knobs.string(
    label: 'Button Label',
    initialValue: 'Label',
  );

  final helperKnob = context.knobs.string(
    label: 'Button Helper',
    initialValue: 'Supporting Text',
  );

  final showError = context.knobs.boolean(
    label: 'Show error',
    initialValue: false,
  );

  final errorKnob = context.knobs.string(
    label: 'Error Text',
    initialValue: 'Error Text',
  );

  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppTextField(
          controller: controller,
          onChanged: (_) {},
          enabled: enabledKnob,
          hintText: helperKnob,
          validator: showError
              ? (_) {
                  return errorKnob;
                }
              : null,
        ),
      ),
    ),
  );
}
