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

/// {@template app_badge_color_type}
/// Predefined badge color type list for [AppBadge]
/// {@endtemplate}
enum AppBadgeColorType {
  /// gray background
  gray,

  /// green background
  success,

  /// blue background
  blueLight,

  /// orange background
  warning,

  /// red background
  error
}

/// {@template app_badge_type}
/// Predefined badge type list for [AppBadge]
/// {@endtemplate}
enum AppBadgeType {
  /// small rounded and default badge type
  badge,

  /// full rounded badge type
  pill,

  /// stable background colored badge type
  modern
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
abstract class AppBadge extends StatelessWidget {
  /// {@macro app_badge}
  factory AppBadge.titled(
    String title, {
    AppBadgeSize badgeSize = AppBadgeSize.md,
    AppBadgeColorType badgeColorType = AppBadgeColorType.gray,
    AppBadgeType badgeType = AppBadgeType.badge,
  }) {
    return _AppBadgeWithTitle(
      title: title,
      badgeSize: badgeSize,
      badgeColorType: badgeColorType,
      badgeType: badgeType,
    );
  }

  const AppBadge._({
    super.key,
    this.badgeSize = AppBadgeSize.md,
    this.badgeColorType = AppBadgeColorType.gray,
    this.badgeType = AppBadgeType.badge,
  });

  /// {@macro app_badge_size}
  final AppBadgeSize badgeSize;

  /// {@macro app_badge_color_type}
  final AppBadgeColorType badgeColorType;

  /// {@macro app_badge_type}
  final AppBadgeType badgeType;

  /// dynamic child builder function for title and icon based [AppBadge]
  Widget buildChild(BuildContext context);

  /// dynamic horizontal padding function for title and icon based [AppBadge]
  double get horizontalPadding => switch (badgeSize) {
        AppBadgeSize.sm => switch (badgeType) {
            AppBadgeType.pill => AppSpacing.md,
            _ => AppSpacing.sm,
          },
        AppBadgeSize.md => switch (badgeType) {
            AppBadgeType.pill => AppSpacing.xmd,
            _ => AppSpacing.md,
          },
        AppBadgeSize.lg => switch (badgeType) {
            AppBadgeType.pill => AppSpacing.lg,
            _ => AppSpacing.xmd,
          }
      };

  /// dynamic vertical padding function for title and icon based [AppBadge]
  double get verticalPadding => switch (badgeSize) {
        AppBadgeSize.lg => AppSpacing.xs,
        _ => AppSpacing.xxs,
      };

  @override
  Widget build(BuildContext context) {
    final badgeTheme = context.badgeTheme;

    final backgroundColor = switch (badgeColorType) {
      AppBadgeColorType.gray => badgeTheme.badgeGray,
      AppBadgeColorType.blueLight => badgeTheme.badgeBlueLight,
      AppBadgeColorType.success => badgeTheme.badgeSuccess,
      AppBadgeColorType.warning => badgeTheme.badgeWarning,
      AppBadgeColorType.error => badgeTheme.badgeError,
    };

    final borderColor = switch (badgeColorType) {
      AppBadgeColorType.gray => badgeTheme.badgeBorderGray,
      AppBadgeColorType.blueLight => badgeTheme.badgeBorderBlueLight,
      AppBadgeColorType.success => badgeTheme.badgeBorderSuccess,
      AppBadgeColorType.warning => badgeTheme.badgeBorderWarning,
      AppBadgeColorType.error => badgeTheme.badgeBorderError,
    };

    final borderRadius = switch (badgeType) {
      AppBadgeType.badge => const BorderRadius.all(AppRadius.md),
      AppBadgeType.pill => const BorderRadius.all(AppRadius.full),
      AppBadgeType.modern => const BorderRadius.all(AppRadius.sm),
    };

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: Border.all(color: borderColor),
      ),
      child: buildChild(context),
    );
  }
}

class _AppBadgeWithTitle extends AppBadge {
  const _AppBadgeWithTitle({
    required this.title,
    required AppBadgeSize badgeSize,
    required AppBadgeColorType badgeColorType,
    required AppBadgeType badgeType,
  }) : super._(
          badgeSize: badgeSize,
          badgeColorType: badgeColorType,
          badgeType: badgeType,
        );

  final String title;

  @override
  Widget buildChild(BuildContext context) {
    final badgeTheme = context.badgeTheme;

    final textColor = switch (badgeColorType) {
      AppBadgeColorType.gray => badgeTheme.badgeTextGray,
      AppBadgeColorType.blueLight => badgeTheme.badgeTextBlueLight,
      AppBadgeColorType.success => badgeTheme.badgeTextSuccess,
      AppBadgeColorType.warning => badgeTheme.badgeTextWarning,
      AppBadgeColorType.error => badgeTheme.badgeTextError,
    };

    final style = switch (badgeSize) {
      AppBadgeSize.sm => context.typography.description12Medium,
      _ => context.typography.description14Medium,
    };

    final leadPadding = switch (badgeSize) {
      AppBadgeSize.sm => AppSpacing.xs,
      _ => AppSpacing.sm,
    };

    return Row(
      children: [
        // if (leading != null) ...[
        //   VectorGraphic(
        //     loader: leading!.icon,
        //     colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
        //   ),
        //   SizedBox(width: leadPadding),
        // ],
        Text(title, style: style.copyWith(color: textColor)),
        // if (trailing != null) ...[
        //   const SizedBox(width: AppSpacing.xs),
        //   VectorGraphic(
        //     loader: trailing!.icon,
        //     colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
        //   ),
        // ],
      ],
    );
  }
}

// class _AppBadgeWithIcon extends AppBadge {
//   const _AppBadgeWithIcon({
//     required this.badgeIcon,
//     required AppBadgeSize badgeSize,
//     required AppBadgeColorType badgeColorType,
//     required AppBadgeType badgeType,
//   }) : super._(
//           badgeSize: badgeSize,
//           badgeColorType: badgeColorType,
//           badgeType: badgeType,
//         );
//
//   final AppBadgeIcon badgeIcon;
//
//   @override
//   double get horizontalPadding => switch (badgeSize) {
//         AppBadgeSize.sm => 5,
//         AppBadgeSize.md => AppSpacing.sm,
//         AppBadgeSize.lg => AppSpacing.md,
//       };
//
//   @override
//   double get verticalPadding => switch (badgeSize) {
//         AppBadgeSize.sm => 5,
//         AppBadgeSize.md => AppSpacing.sm,
//         AppBadgeSize.lg => AppSpacing.md,
//       };
//
//   @override
//   Widget buildChild(BuildContext context) {
//     final badgeTheme = context.badgeTheme;
//
//     final iconColor = switch (badgeColorType) {
//       AppBadgeColorType.gray => badgeTheme.badgeTextGray,
//       AppBadgeColorType.blueLight => badgeTheme.badgeTextBlueLight,
//       AppBadgeColorType.success => badgeTheme.badgeTextSuccess,
//       AppBadgeColorType.warning => badgeTheme.badgeTextWarning,
//       AppBadgeColorType.error => badgeTheme.badgeTextError,
//     };
//
//     return VectorGraphic(
//       loader: badgeIcon.icon,
//       colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
//     );
//   }
// }
