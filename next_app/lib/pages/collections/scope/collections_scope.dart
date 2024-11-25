import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_app/features/collection/collection.dart';

import '../../../injection/collection/collection_dependencies_container.dart';
import '../../../injection/collection/collection_dependencies_factory.dart';
import '../../../injection/widget/dependencies_scope.dart';

class CollectionsScope extends StatefulWidget {
  const CollectionsScope({
    super.key,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  State<CollectionsScope> createState() => _CollectionsScopeState();
}

class _CollectionsScopeState extends State<CollectionsScope> {
  CollectionDependenciesContainer? _collectionDependencies;

  @override
  void initState() {
    super.initState();

    final dependencies = DependenciesScope.of(context);
    _collectionDependencies =
        CollectionDependenciesFactory(dependencies).create();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionsBloc(
        _collectionDependencies!.getCollectionsUseCase,
      )..add(CollectionsRequired(type: CollectionTypes.all)),
      child: Builder(builder: widget.builder),
    );
  }

  @override
  void dispose() {
    _collectionDependencies = null;
    super.dispose();
  }
}
