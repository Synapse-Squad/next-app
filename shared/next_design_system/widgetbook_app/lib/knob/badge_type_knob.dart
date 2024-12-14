import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

extension BadgeTypeKnobBuilder on KnobsBuilder {
  AppBadgeType badgeType({
    required String label,
    AppBadgeType initialValue = AppBadgeType.badge,
  }) =>
      onKnobAdded(
        AppBadgeTypeKnob(
          label: label,
          initialValue: initialValue,
        ),
      )!;
}

class AppBadgeTypeKnob extends Knob<AppBadgeType> {
  AppBadgeTypeKnob({
    required super.label,
    required super.initialValue,
  });

  @override
  List<Field> get fields => [
        ListField<AppBadgeType>(
          name: label,
          values: [
            AppBadgeType.badge,
            AppBadgeType.pill,
            AppBadgeType.modern,
          ],
          initialValue: initialValue,
        ),
      ];

  @override
  AppBadgeType valueFromQueryGroup(Map<String, String> group) {
    return valueOf(label, group);
  }
}
