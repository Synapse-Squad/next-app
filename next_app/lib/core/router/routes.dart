import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_app/core/extensions/core_module_ext.dart';
import 'package:user_collections/user_collections.dart';

import '../../pages/collections/bloc/collections_bloc.dart';
import '../../pages/collections/collections_page.dart';
import '../../pages/create_collection/bloc/create_collection_bloc.dart';
import '../../pages/create_collection/create_collection_page.dart';

part 'routes.g.dart';

@TypedGoRoute<CollectionsRoute>(path: '/collections')
class CollectionsRoute extends GoRouteData {
  const CollectionsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserCollectionsModuleScope(
      database: context.coreModule.nextDatabase,
      builder: (context) {
        return BlocProvider(
          create: (_) => CollectionsBloc(
            context.userCollectionsModule.getCollectionsUseCase,
          )..add(const CollectionsRequired()),
          child: CollectionsPage(),
        );
      },
    );
  }
}

@TypedGoRoute<CreateCollectionsRoute>(path: '/create-collection')
class CreateCollectionsRoute extends GoRouteData {
  const CreateCollectionsRoute(this.$extra);

  final ({
    CollectionsBloc collectionsBloc,
    CreateCollectionUseCase createCollectionUseCase,
  }) $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: $extra.collectionsBloc),
        BlocProvider(
          create: (context) => CreateCollectionBloc(
            createCollectionUseCase: $extra.createCollectionUseCase,
          ),
        ),
      ],
      child: CreateCollectionPage(),
    );
  }
}
