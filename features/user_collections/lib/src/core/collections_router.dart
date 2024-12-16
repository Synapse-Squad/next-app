import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_database_service/next_database_service.dart';

import '../module/user_collections_module_scope.dart';
import '../presentation/collections/bloc/collections_bloc.dart';
import '../presentation/collections/views/collections_page.dart';

enum CollectionRoutes {
  collections('/collections'),
  createCollection('collections/create');

  const CollectionRoutes(this.path);

  final String path;
}

class CollectionsRouter {
  CollectionsRouter._();

  static List<GoRoute> configRoutes(NextDatabase database) {
    return [
      GoRoute(
        path: CollectionRoutes.collections.path,
        builder: (context, state) => UserCollectionsModuleScope(
          database: database,
          builder: (context) => BlocProvider(
            create: (context) => CollectionsBloc(
              context.userCollectionsModule.getCollectionsUseCase,
            )..add(const CollectionsRequired()),
            child: const CollectionsPage(),
          ),
        ),
      ),
      GoRoute(
        path: CollectionRoutes.createCollection.path,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: extra['collectionsBloc'] as CollectionsBloc,
              ),
            ],
            child: UserCollectionsModuleScope(
              database: database,
              builder: (context) => const CollectionsPage(),
            ),
          );
        },
      ),
    ];
  }
}
