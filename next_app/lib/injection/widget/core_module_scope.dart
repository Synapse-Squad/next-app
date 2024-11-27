import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:next_app/injection/core/core_module.dart';

class CoreModuleScope extends InheritedWidget {
  const CoreModuleScope({
    required super.child,
    required this.coreModule,
    super.key,
  });

  final CoreModule coreModule;

  static CoreModule of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<CoreModuleScope>()!.coreModule;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<CoreModule>(
        'coreModule',
        coreModule,
      ),
    );
  }

  @override
  bool updateShouldNotify(CoreModuleScope oldWidget) => false;
}
