import 'package:flutter/material.dart';
import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppBadge',
  type: AppBadge,
  designLink: '',
)
Widget appBadgeUseCase(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Title');
  final checked = context.knobs.boolean(
    label: 'Checked',
    initialValue: false,
  );

  return Scaffold(
    body: SafeArea(
      child: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBadge(
              title: title,
              badgeSize: AppBadgeSize.sm,
              checked: checked,
            ),
            AppBadge(
              title: title,
              badgeSize: AppBadgeSize.md,
              checked: checked,
            ),
            AppBadge(
              title: title,
              badgeSize: AppBadgeSize.lg,
              checked: checked,
            ),
          ],
        ),
      ),
    ),
  );
}
