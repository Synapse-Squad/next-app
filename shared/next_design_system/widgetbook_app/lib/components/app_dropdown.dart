import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum PopupActions { add, remove, multiply, divide }

@widgetbook.UseCase(
  name: 'AppDropdownField',
  type: AppDropdownField,
  designLink: '',
)
Widget appDropdownFieldUseCase(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppDropdownField<String>(
              defaultTitle: 'Default title shown here...',
              constraints: const BoxConstraints(
                maxWidth: 320,
                maxHeight: 140,
              ),
              items: const [
                (action: 'all', title: 'Hamısı'),
                (action: 'week', title: 'Bu Həftə'),
                (action: 'month', title: 'Bu ay'),
                (action: 'year', title: 'Bu il'),
              ],
              onChanged: (selectedItem) {
                debugPrintThrottled(selectedItem.action);
              },
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'AppDropdownItem',
  type: AppDropdownItem,
  designLink: '',
)
Widget appDropdownItemUseCase(BuildContext context) {
  final item = AppDropdownItem(
    label: 'Kanan Yusubov Test',
    onTap: () {},
    // leading: (color) {
    //   return VectorGraphic(
    //     loader: AppAssets.person,
    //     colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    //   );
    // },
    // trailing: (color) {
    //   return VectorGraphic(
    //     loader: AppAssets.bag,
    //     colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    //   );
    // },
  );

  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        item,
        item,
        item,
        item,
        item,
        item,
      ],
    ),
  );
}
