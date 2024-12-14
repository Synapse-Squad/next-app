// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_app/components/app_badge.dart' as _i2;
import 'package:widgetbook_app/components/app_checkbox.dart' as _i3;
import 'package:widgetbook_app/components/app_dropdown.dart' as _i8;
import 'package:widgetbook_app/components/app_text_buttons.dart' as _i6;
import 'package:widgetbook_app/components/app_text_field.dart' as _i7;
import 'package:widgetbook_app/components/app_toggle.dart' as _i4;
import 'package:widgetbook_app/components/app_tooltip.dart' as _i5;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'AppBadge',
        useCase: _i1.WidgetbookUseCase(
          name: 'AppBadge',
          builder: _i2.appBadgeUseCase,
          designLink: '',
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppCheckbox',
        useCase: _i1.WidgetbookUseCase(
          name: 'AppCheckbox',
          builder: _i3.appSwitchUseCase,
          designLink: '',
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppToggle',
        useCase: _i1.WidgetbookUseCase(
          name: 'AppToggle',
          builder: _i4.appToggleUseCase,
          designLink: '',
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppTooltip',
        useCase: _i1.WidgetbookUseCase(
          name: 'AppTooltip',
          builder: _i5.appTooltipUseCase,
          designLink: '',
        ),
      ),
      _i1.WidgetbookFolder(
        name: 'buttons',
        children: [
          _i1.WidgetbookFolder(
            name: 'app_text_buttons',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'AppTextButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Text Buttons',
                  builder: _i6.textButtonsUseCase,
                  designLink: '',
                ),
              )
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'inputs',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'AppTextField',
            useCase: _i1.WidgetbookUseCase(
              name: 'AppTextField',
              builder: _i7.appTextFieldUseCase,
              designLink: '',
            ),
          ),
          _i1.WidgetbookFolder(
            name: 'dropdown',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'AppDropdownField',
                useCase: _i1.WidgetbookUseCase(
                  name: 'AppDropdownField',
                  builder: _i8.appDropdownFieldUseCase,
                  designLink: '',
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'AppDropdownItem',
                useCase: _i1.WidgetbookUseCase(
                  name: 'AppDropdownItem',
                  builder: _i8.appDropdownItemUseCase,
                  designLink: '',
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  )
];
