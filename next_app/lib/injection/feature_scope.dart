import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../../injection/widget/dependencies_scope.dart';
import 'global/dependencies_container.dart';

typedef DependencyContainerBuilder<T> = T Function(
  DependenciesContainer dependencies,
);

typedef WidgetBuilderWithDependency<T> = Widget Function(
  BuildContext context,
  T dependencies,
);

class FeatureScope<T> extends StatefulWidget {
  const FeatureScope({
    super.key,
    required this.dependencyContainerBuilder,
    required this.widgetBuilderWithDependency,
  });

  final DependencyContainerBuilder<T> dependencyContainerBuilder;
  final WidgetBuilderWithDependency<T> widgetBuilderWithDependency;

  @override
  State<FeatureScope<T>> createState() => _FeatureScopeState<T>();
}

class _FeatureScopeState<T> extends State<FeatureScope<T>> {
  late final T _dependencies;
  final _logger = Logger('Feature:');

  @override
  void initState() {
    super.initState();

    final dependencies = DependenciesScope.of(context);
    _dependencies = widget.dependencyContainerBuilder(dependencies);

    _logger.info('$T initialized');
  }

  @override
  Widget build(BuildContext context) {
    return widget.widgetBuilderWithDependency(context, _dependencies);
  }

  @override
  void dispose() {
    _logger.info('$T disposed');
    super.dispose();
  }
}
