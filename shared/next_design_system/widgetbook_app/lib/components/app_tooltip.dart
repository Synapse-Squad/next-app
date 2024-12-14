import 'package:flutter/material.dart';
import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_app/knob/tooltip_position_knob.dart';

@widgetbook.UseCase(
  name: 'AppTooltip',
  type: AppTooltip,
  designLink: '',
)
Widget appTooltipUseCase(BuildContext context) {
  final tooltipPositionKnob = context.knobs.tooltipPosition(
    label: 'Tooltip Position',
  );

  final titleKnob = context.knobs.string(
    label: 'Title',
    initialValue: 'This is a tooltip',
  );

  final subTitleKnob = context.knobs.string(
    label: 'SubTitle',
    initialValue:
        '''Tooltips are used to describe or identify an element. In most scenarios, tooltips help the user understand meaning, function or alt-text.''',
  );

  return Scaffold(
    body: Center(
      child: AppTooltip(
        position: tooltipPositionKnob,
        title: titleKnob,
        subTitle: subTitleKnob.isNotEmpty ? subTitleKnob : null,
        child: GestureDetector(child: const Text('Hover over me')),
      ),
    ),
  );
}
