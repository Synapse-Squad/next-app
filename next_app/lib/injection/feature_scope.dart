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

class ProviderScope<T> extends StatefulWidget {
  const ProviderScope({
    super.key,
    required this.dependencyContainerBuilder,
    required this.widgetBuilderWithDependency,
  });

  final DependencyContainerBuilder<T> dependencyContainerBuilder;
  final WidgetBuilderWithDependency<T> widgetBuilderWithDependency;

  @override
  State<ProviderScope<T>> createState() => _ProviderScopeState<T>();
}

class _ProviderScopeState<T> extends State<ProviderScope<T>> {
  T? _dependencies;
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
    return widget.widgetBuilderWithDependency(context, _dependencies as T);
  }

  @override
  void dispose() {
    _dependencies = null;
    _logger.info('$T disposed');
    super.dispose();
  }
}
