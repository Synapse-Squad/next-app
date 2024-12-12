import 'package:flutter/material.dart';

import '../../injection/core/core_module.dart';
import '../../injection/widget/core_module_scope.dart';

extension CoreModuleExt on BuildContext {
  CoreModule get coreModule => CoreModuleScope.of(this);
}
