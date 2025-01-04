import 'package:flutter/material.dart';
import 'package:next_design_system/src/core/extensions/theme_ext.dart';

import '../atoms/app_spacing.dart';
import 'app_text.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    this.leading,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.onLongPressed,
  });

  final Widget? leading;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final VoidCallback? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPressed,
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: AppSpacing.xl),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  style: context.typography.titleMedium,
                  color: context.typographyTheme.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: AppSpacing.xxs),
                AppText(
                  subtitle,
                  style: context.typography.subtitleSmall,
                  color: context.typographyTheme.subTitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
