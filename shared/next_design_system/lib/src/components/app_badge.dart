import 'package:flutter/material.dart';
import 'package:next_design_system/src/core/extensions/theme_ext.dart';

import '../atoms/app_radius.dart';
import '../atoms/app_spacing.dart';

/// {@template app_badge_size}
/// Predefined badge size list for [AppBadge]
/// {@endtemplate}
enum AppBadgeSize {
  /// small size
  sm,

  /// medium size
  md,

  /// large size
  lg
}

/// {@template app_badge_type}
/// Predefined badge type list for [AppBadge]
/// {@endtemplate}
enum AppBadgeType {
  /// small rounded and default badge type
  badge
}

/// {@template app_badge}
/// Badge component of app to show titled or icon based badge
///
/// The following properties are adjustable:
/// - icon or text based badge
/// - selection of badge type (pill, badge or modern)
/// - 3 types of bade size (small, medium and large)
/// - leading and trailing icon
/// - color type for different situations (error, success and etc)
/// {@endtemplate}
class AppBadge extends StatelessWidget {
  /// {@macro app_badge}
  const AppBadge({
    super.key,
    this.badgeSize = AppBadgeSize.md,
    this.badgeType = AppBadgeType.badge,
    required this.title,
    this.checked = false,
    this.onTap,
  });

  /// {@macro app_badge_size}
  final AppBadgeSize badgeSize;

  /// {@macro app_badge_type}
  final AppBadgeType badgeType;

  /// title for badge
  final String title;

  final bool checked;

  final VoidCallback? onTap;

  /// dynamic horizontal padding function for title and icon based [AppBadge]
  double get horizontalPadding => AppSpacing.xl2;

  /// dynamic vertical padding function for title and icon based [AppBadge]
  double get verticalPadding => AppSpacing.xs;

  @override
  Widget build(BuildContext context) {
    final badgeTheme = context.badgeTheme;
    final borderRadius = const BorderRadius.all(AppRadius.xl2);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: checked
              ? badgeTheme.selectedBackgroundColor
              : badgeTheme.backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (checked) ...[
              FittedBox(
                child: Icon(
                  Icons.check,
                  color: checked
                      ? badgeTheme.selectedTextColor
                      : badgeTheme.textColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
            ],
            Text(
              title,
              style: context.typography.buttonMedium.copyWith(
                color: checked
                    ? badgeTheme.selectedTextColor
                    : badgeTheme.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
