import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:next_app/injection/global/dependencies_factory.dart';

import 'composition_result.dart';
import 'config.dart';

final class CompositionRoot {
  const CompositionRoot(this.config);

  final Config config;

  Future<CompositionResult> compose() async {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      debugPrintThrottled(
        '${record.level.name}: '
        '${record.time}: ${record.message}',
      );
    });

    final stopwatch = clock.stopwatch()..start();
    final logger = Logger('CompositionRootLogger');

    /// global dependencies
    logger.info('Initializing global dependencies...');
    final dependencies = GlobalDependenciesFactory().create();
    logger.finest('Global dependencies initialized');

    // /// itunes feature dependencies
    // logger.info('Initializing itunes dependencies...');
    // final itunesDependencies = ItunesDependenciesFactory(
    //   dependenciesContainer: dependencies,
    //   config: config,
    // ).create();
    // logger.finest('Itunes dependencies initialized');

    stopwatch.stop();
    logger.finest('consumed time: ${stopwatch.elapsed}');

    final result = CompositionResult(dependencies: dependencies);

    return result;
  }
}
