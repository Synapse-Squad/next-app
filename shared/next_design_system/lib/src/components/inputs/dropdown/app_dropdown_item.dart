part of 'app_dropdown_field.dart';

class AppDropdownItem extends StatelessWidget {
  const AppDropdownItem({
    super.key,
    required this.label,
    this.leading,
    this.trailing,
    this.onTap,
    this.selected = false,
  });

  final String label;
  final IconBuilder? leading;
  final IconBuilder? trailing;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.all(
          context.appDropdownTheme.hoverColor,
        ),
        shape: WidgetStateProperty.resolveWith(
          (states) {
            const shape = RoundedRectangleBorder(
              borderRadius: BorderRadius.all(AppRadius.sm),
            );

            if (states.contains(WidgetState.focused)) {
              return shape.copyWith(
                side: BorderSide(
                  color: context.appDropdownTheme.focusedBorder,
                ),
              );
            }

            return shape;
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.focused) ||
                selected) {
              return context.appDropdownTheme.hoverColor;
            }

            return Colors.transparent;
          },
        ),

        // fixedSize: WidgetStatePropertyAll(Size(185, 40)),
        padding: WidgetStateProperty.all(EdgeInsets.zero),

        foregroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return context.appDropdownTheme.disabledText;
            }

            return context.appDropdownTheme.defaultText;
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.xmd,
          AppSpacing.xmd,
          AppSpacing.xmd,
        ),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!(
                onTap != null
                    ? context.appDropdownTheme.defaultText
                    : context.appDropdownTheme.disabledText,
              ),
              const SizedBox(width: AppSpacing.md),
            ],
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
                child: Text(
                  label,
                  style: context.typography.subtitle16Medium,
                ),
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: AppSpacing.md),
              trailing!(
                onTap != null
                    ? context.appDropdownTheme.defaultText
                    : context.appDropdownTheme.disabledText,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
