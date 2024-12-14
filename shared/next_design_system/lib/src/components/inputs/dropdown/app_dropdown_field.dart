import 'package:flutter/material.dart';
import 'package:next_design_system/src/core/extensions/theme_ext.dart';

import '../../../atoms/app_radius.dart';
import '../../../atoms/app_spacing.dart';
import '../../../core/base_app_popup.dart';
import '../../../core/icon_builder.dart';
import 'app_dropdown_popup.dart';

part 'app_dropdown_item.dart';

typedef AppDropdownItemPrototype<T> = ({T action, String title});

class AppDropdownField<Action> extends StatefulWidget {
  const AppDropdownField({
    super.key,
    required this.defaultTitle,
    required this.items,
    required this.constraints,
    this.onChanged,
    this.popUpMargin = EdgeInsets.zero,
  });

  final String defaultTitle;
  final List<AppDropdownItemPrototype<Action>> items;
  final BoxConstraints constraints;
  final ValueChanged<AppDropdownItemPrototype<Action>>? onChanged;
  final EdgeInsets popUpMargin;

  @override
  State<AppDropdownField<Action>> createState() =>
      _AppDropdownFieldState<Action>();
}

class _AppDropdownFieldState<Action> extends State<AppDropdownField<Action>> {
  final _dropdownFieldKey = GlobalKey();
  final _controller = OverlayPortalController();
  var _selectedItemIndex = -1;
  final _popupVisibilityNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final selectedTitle = _selectedItemIndex == -1
        ? null
        : widget.items[_selectedItemIndex].title;

    return AppPopup(
      controller: _controller,
      onTap: () {
        _controller.show();
        _popupVisibilityNotifier.value = true;
      },
      onTapOutside: () {
        _controller.hide();
        _popupVisibilityNotifier.value = false;
      },
      useTapToOpenPopup: true,
      offset: const Offset(0, 4),
      child: ValueListenableBuilder<bool>(
        valueListenable: _popupVisibilityNotifier,
        builder: (context, visible, _) {
          return _AppDropdownField(
            key: _dropdownFieldKey,
            opened: visible,
            title: selectedTitle ?? widget.defaultTitle,
            constraints: widget.constraints,
          );
        },
      ),
      follower: (context, size) {
        return Padding(
          padding: widget.popUpMargin,
          child: AppDropdownPopup(
            builder: (context) {
              return Scrollbar(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  itemBuilder: (context, index) {
                    final item = widget.items[index];
                    final selected = _selectedItemIndex == index;

                    return AppDropdownItem(
                      label: item.title,
                      selected: selected,
                      onTap: () {
                        setState(() {
                          _selectedItemIndex = index;
                        });

                        widget.onChanged
                            ?.call(widget.items[_selectedItemIndex]);
                        _controller.hide();
                        _popupVisibilityNotifier.value = false;
                      },
                      // trailing: selected
                      //     ? (_) => const VectorGraphic(loader: AppAssets.check)
                      //     : null,
                    );
                  },
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: AppSpacing.xs),
                  itemCount: widget.items.length,
                ),
              );
            },
            constraints: widget.constraints,
          ),
        );
      },
    );
  }
}

class _AppDropdownField extends StatelessWidget {
  const _AppDropdownField({
    super.key,
    required this.title,
    required this.constraints,
    this.opened = false,
  });

  final String title;
  final BoxConstraints constraints;
  final bool opened;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.xmd,
      ),
      width: constraints.maxWidth,
      decoration: BoxDecoration(
        color: context.inputTheme.defaultColor,
        borderRadius: const BorderRadius.all(AppRadius.md),
        border: Border.all(
          color: opened
              ? context.inputTheme.focusedBorderColor
              : context.inputTheme.borderColor,
        ),
      ),
      child: Text(
        title,
        style: context.typography.inputPlaceHolder.copyWith(
          color: context.inputTheme.textColor,
        ),
      ),
    );
  }
}
