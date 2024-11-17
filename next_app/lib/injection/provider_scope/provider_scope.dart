import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../../../injection/widget/dependencies_scope.dart';
import '../global/dependencies_container.dart';

enum _ProviderType { newInstance, previousInstance }

typedef DependencyContainerBuilder<T> = T Function(
  DependenciesContainer dependencies,
);

typedef WidgetBuilderWithDependency<T> = Widget Function(
  BuildContext context,
  T dependencies,
  Widget child,
);

class ProviderScope<T> extends StatefulWidget {
  const ProviderScope._({
    super.key,
    required this.child,
    this.dependencyContainerBuilder,
    this.widgetBuilderWithDependency,
    this.value,
    required this.type,
  });

  const ProviderScope({
    Key? key,
    required Widget child,
    required DependencyContainerBuilder<T> dependencyContainerBuilder,
    required WidgetBuilderWithDependency<T> widgetBuilderWithDependency,
  }) : this._(
          key: key,
          dependencyContainerBuilder: dependencyContainerBuilder,
          widgetBuilderWithDependency: widgetBuilderWithDependency,
          child: child,
          type: _ProviderType.newInstance,
        );

  const ProviderScope.value({
    Key? key,
    required Widget child,
    required T value,
  }) : this._(
          key: key,
          value: value,
          child: child,
          type: _ProviderType.previousInstance,
        );

  final Widget child;
  final DependencyContainerBuilder<T>? dependencyContainerBuilder;
  final WidgetBuilderWithDependency<T>? widgetBuilderWithDependency;
  final T? value;
  final _ProviderType type;

  @override
  State<ProviderScope<T>> createState() => _ProviderScopeState<T>();
}

class _ProviderScopeState<T> extends State<ProviderScope<T>> {
  T? _dependencies;
  final _logger = Logger('ProviderScope');

  @override
  void initState() {
    super.initState();

    if (widget.type == _ProviderType.newInstance) {
      final dependencies = DependenciesScope.of(context);
      _dependencies = widget.dependencyContainerBuilder!(dependencies);
    } else {
      _dependencies = widget.value;
    }

    _logger.info('$T initialized');
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == _ProviderType.newInstance) {
      return widget.widgetBuilderWithDependency!(
        context,
        _dependencies as T,
        widget.child,
      );
    }

    return _ProviderValueScope(
      child: widget.child,
      value: _dependencies!,
    );
  }

  @override
  void dispose() {
    _dependencies = null;
    _logger.info('$T disposed');
    super.dispose();
  }
}

class _ProviderValueScope<T> extends InheritedWidget {
  const _ProviderValueScope({
    required super.child,
    required this.value,
    super.key,
  });

  final T value;

  @override
  bool updateShouldNotify(_ProviderValueScope oldWidget) => false;
}
