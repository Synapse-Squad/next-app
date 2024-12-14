import 'package:flutter/material.dart';
import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_app/knob/badge_type_knob.dart';

@widgetbook.UseCase(
  name: 'AppBadge',
  type: AppBadge,
  designLink: '',
)
Widget appBadgeUseCase(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Title');
  final type = context.knobs.badgeType(label: 'Badge Type');
  // final leading = context.knobs.badgeIcon(
  //   label: 'Leading Icon',
  //   initialValue: AppBadgeIcon.plus,
  // );
  // final trailing = context.knobs.badgeIcon(
  //   label: 'Trailing Icon',
  //   initialValue: AppBadgeIcon.plus,
  // );

  final badgeList = <List<AppBadge>>[
    [
      AppBadge.titled(
        title,
        badgeSize: AppBadgeSize.sm,
        badgeType: type,
      ),
      AppBadge.titled(
        title,
        badgeSize: AppBadgeSize.md,
        badgeType: type,
      ),
      AppBadge.titled(
        title,
        badgeSize: AppBadgeSize.lg,
        badgeType: type,
      ),
    ],
    [
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.error,
        badgeSize: AppBadgeSize.sm,
        badgeType: type,
      ),
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.error,
        badgeSize: AppBadgeSize.md,
        badgeType: type,
      ),
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.error,
        badgeSize: AppBadgeSize.lg,
        badgeType: type,
      ),
    ],
    [
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.warning,
        badgeSize: AppBadgeSize.sm,
        badgeType: type,
      ),
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.warning,
        badgeSize: AppBadgeSize.md,
        badgeType: type,
      ),
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.warning,
        badgeSize: AppBadgeSize.lg,
        badgeType: type,
      ),
    ],
    [
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.success,
        badgeSize: AppBadgeSize.sm,
        badgeType: type,
      ),
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.success,
        badgeSize: AppBadgeSize.md,
        badgeType: type,
      ),
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.success,
        badgeSize: AppBadgeSize.lg,
        badgeType: type,
      ),
    ],
    [
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.blueLight,
        badgeSize: AppBadgeSize.sm,
        badgeType: type,
      ),
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.blueLight,
        badgeSize: AppBadgeSize.md,
        badgeType: type,
      ),
      AppBadge.titled(
        title,
        badgeColorType: AppBadgeColorType.blueLight,
        badgeSize: AppBadgeSize.lg,
        badgeType: type,
      ),
    ],
  ];

  return Scaffold(
    body: SafeArea(
      child: Center(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final currentList = badgeList[index];

            return Center(
              child: SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return UnconstrainedBox(child: currentList[index]);
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemCount: currentList.length,
                ),
              ),
            );
          },
          itemCount: badgeList.length,
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
