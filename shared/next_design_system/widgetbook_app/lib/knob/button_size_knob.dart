import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

extension RangeKnobBuilder on KnobsBuilder {
  AppButtonSize buttonSize({
    required String label,
    AppButtonSize initialValue = AppButtonSize.medium,
  }) =>
      onKnobAdded(
        AppButtonSizeKnob(
          label: label,
          initialValue: initialValue,
        ),
      )!;
}

class AppButtonSizeKnob extends Knob<AppButtonSize> {
  AppButtonSizeKnob({
    required super.label,
    required super.initialValue,
  });

  @override
  List<Field> get fields => [
        ListField<AppButtonSize>(
          name: label,
          values: [
            AppButtonSize.small,
            AppButtonSize.medium,
            AppButtonSize.large,
            AppButtonSize.xlarge,
            AppButtonSize.xxLarge,
          ],
          initialValue: initialValue,
        ),
      ];

  @override
  AppButtonSize valueFromQueryGroup(Map<String, String> group) {
    return valueOf(label, group);
  }
}
