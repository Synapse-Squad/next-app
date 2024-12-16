import 'package:flutter/material.dart';
import 'package:next_database_service/next_database_service.dart';

import 'user_collections_module_dependencies.dart';
import 'user_collections_module_factory.dart';

extension UserCollectionsModuleProviderExt on BuildContext {
  UserCollectionsModuleDependencies get userCollectionsModule =>
      _UserCollectionsModuleProvider.of(this);
}

class UserCollectionsModuleScope extends StatefulWidget {
  const UserCollectionsModuleScope({
    super.key,
    required this.database,
    required this.builder,
  });

  final NextDatabase database;
  final WidgetBuilder builder;

  @override
  State<UserCollectionsModuleScope> createState() =>
      _UserCollectionsModuleScopeState();
}

class _UserCollectionsModuleScopeState
    extends State<UserCollectionsModuleScope> {
  UserCollectionsModuleDependencies? _module;

  @override
  void initState() {
    super.initState();
    _module = UserCollectionsModuleFactory(widget.database).create();
  }

  @override
  Widget build(BuildContext context) {
    return _UserCollectionsModuleProvider(
      module: _module!,
      child: Builder(builder: widget.builder),
    );
  }

  @override
  void dispose() {
    _module = null;
    super.dispose();
  }
}

class _UserCollectionsModuleProvider extends InheritedWidget {
  const _UserCollectionsModuleProvider({
    required super.child,
    required this.module,
  });

  final UserCollectionsModuleDependencies module;

  static UserCollectionsModuleDependencies of(BuildContext context) => context
      .getInheritedWidgetOfExactType<_UserCollectionsModuleProvider>()!
      .module;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
