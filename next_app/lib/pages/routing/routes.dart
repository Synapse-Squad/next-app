import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/collection/collection.dart';
import '../collection/collections_page.dart';
import '../collection/create_collection_page.dart';

part 'routes.g.dart';

@TypedGoRoute<CollectionsRoute>(path: '/collections')
class CollectionsRoute extends GoRouteData {
  const CollectionsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CollectionsPage();
  }
}

@TypedGoRoute<CreateCollectionsRoute>(path: '/create-collection')
class CreateCollectionsRoute extends GoRouteData {
  const CreateCollectionsRoute(this.$extra);

  final ({
    CreateCollectionBloc createBloc,
    CollectionsBloc collectionsBloc,
  }) $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: $extra.createBloc),
        BlocProvider.value(value: $extra.collectionsBloc),
      ],
      child: CreateCollectionPage(),
    );
  }
}
