import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../injection/composition_result.dart';
import '../injection/widget/core_module_scope.dart';
import 'router/router.dart';

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
    return CoreModuleScope(
      coreModule: widget.result.dependencies,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale('az'),
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
          ),
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: Colors.black,
            foregroundColor: Colors.white,
            //other options
          ),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
