import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:next_design_system/next_design_system.dart';

import 'app.dart';
import 'core/bloc/bloc_observer.dart';
import 'injection/composition_root.dart';
import 'injection/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrintThrottled(
      '${record.loggerName} '
      '[${record.level.name}]: '
      '${record.time}: ${record.message}',
    );
  });

  Bloc.observer = NextBlocObserver();
  const config = Config();
  final compositionResult = await const CompositionRoot(config).compose();

  final app = await ThemeScopeWidget.initialize(
    NextApp(result: compositionResult),
  );

  runApp(app);
}
