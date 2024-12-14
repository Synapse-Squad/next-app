import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

extension RangeKnobBuilder on KnobsBuilder {
  TooltipPosition tooltipPosition({
    required String label,
    TooltipPosition initialValue = TooltipPosition.rightTop,
  }) =>
      onKnobAdded(
        TooltipPositionKnob(
          label: label,
          initialValue: initialValue,
        ),
      )!;
}

class TooltipPositionKnob extends Knob<TooltipPosition> {
  TooltipPositionKnob({
    required super.label,
    required super.initialValue,
  });

  @override
  List<Field> get fields => [
        ListField<TooltipPosition>(
          name: label,
          values: [
            TooltipPosition.topLeft,
            TooltipPosition.topCenter,
            TooltipPosition.topRight,
            TooltipPosition.bottomLeft,
            TooltipPosition.bottomCenter,
            TooltipPosition.bottomRight,
            TooltipPosition.leftTop,
            TooltipPosition.leftCenter,
            TooltipPosition.leftBottom,
            TooltipPosition.rightTop,
            TooltipPosition.rightCenter,
            TooltipPosition.rightBottom,
          ],
          initialValue: initialValue,
        ),
      ];

  @override
  TooltipPosition valueFromQueryGroup(Map<String, String> group) {
    return valueOf(label, group);
  }
}
