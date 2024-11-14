import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:next_app/injection/global/dependencies_container.dart';

class DependenciesScope extends InheritedWidget {
  const DependenciesScope({
    required super.child,
    required this.dependencies,
    super.key,
  });

  final DependenciesContainer dependencies;

  static DependenciesContainer of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<DependenciesScope>()!.dependencies;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<DependenciesContainer>(
        'dependencies',
        dependencies,
      ),
    );
  }

  @override
  bool updateShouldNotify(DependenciesScope oldWidget) => false;
}
