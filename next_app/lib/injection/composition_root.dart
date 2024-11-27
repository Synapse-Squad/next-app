import 'package:clock/clock.dart';
import 'package:logging/logging.dart';

import 'composition_result.dart';
import 'config.dart';
import 'core/core_module_factory.dart';

final class CompositionRoot {
  const CompositionRoot(this.config);

  final Config config;

  Future<CompositionResult> compose() async {
    final stopwatch = clock.stopwatch()..start();
    final logger = Logger('CompositionRootLogger');

    /// global dependencies
    logger.info('Initializing global dependencies...');
    final dependencies = CoreModuleFactory(config).create();
    stopwatch.stop();
    logger.finest('Global dependencies initialized');
    logger.finest('consumed time: ${stopwatch.elapsed}');

    final result = CompositionResult(dependencies: dependencies);
    return result;
  }
}
