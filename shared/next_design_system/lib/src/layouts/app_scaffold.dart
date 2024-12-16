import 'package:flutter/material.dart';
import 'package:next_design_system/src/core/extensions/theme_ext.dart';

import '../atoms/app_spacing.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: context.layoutTheme.pageBackground,
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
