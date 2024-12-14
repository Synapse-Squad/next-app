import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:next_design_system/next_design_system.dart';

import '../core/router/router.dart';
import '../injection/composition_result.dart';
import '../injection/widget/core_module_scope.dart';

class NextApp extends StatefulWidget {
  const NextApp({
    super.key,
    required this.result,
  });

  final CompositionResult result;

  @override
  State<NextApp> createState() => _NextAppState();
}

class _NextAppState extends State<NextApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeScope.of(context);

    return CoreModuleScope(
      coreModule: widget.result.dependencies,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale('az'),
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          useMaterial3: true,
          fontFamily: 'DMSans',
          extensions: [theme.appTheme],
          scaffoldBackgroundColor:
              (theme.appTheme.appLayoutTheme as AppLayoutTheme).pageBackground,
        ),
        routerConfig: router,
      ),
    );
  }
}
