import 'package:clock/clock.dart';
import 'package:logging/logging.dart';
import 'package:next_app/injection/global/dependencies_factory.dart';

import 'composition_result.dart';
import 'config.dart';

final class CompositionRoot {
  const CompositionRoot(this.config);

  final Config config;

  Future<CompositionResult> compose() async {
    final stopwatch = clock.stopwatch()..start();
    final logger = Logger('CompositionRootLogger');

    /// global dependencies
    logger.info('Initializing global dependencies...');
    final dependencies = GlobalDependenciesFactory(config).create();
    stopwatch.stop();
    logger.finest('Global dependencies initialized');
    logger.finest('consumed time: ${stopwatch.elapsed}');

    final result = CompositionResult(dependencies: dependencies);
    return result;
  }
}
