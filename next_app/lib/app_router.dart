import 'package:go_router/go_router.dart';
import 'package:next_app/injection/core/core_module.dart';
import 'package:user_collections/user_collections.dart';

class AppRouter {
  static configRoutes(CoreModule core) {
    return GoRouter(
      initialLocation: CollectionRoutes.collections.path,
      routes: [
        ...CollectionsRouter.configRoutes(core.nextDatabase),
      ],
    );
  }
}
