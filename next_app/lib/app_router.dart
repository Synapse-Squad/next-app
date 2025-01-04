import 'package:go_router/go_router.dart';
import 'package:next_app/counter_page.dart';
import 'package:next_app/counter_view_model.dart';
import 'package:next_app/injection/core/core_module.dart';
import 'package:state_manager/state_manager.dart';
import 'package:user_collections/user_collections.dart';

class AppRouter {
  static late final CoreModule coreModule;

  static final config = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => ViewModelProvider(
          viewModel: CounterViewModel(),
          child: CounterPage(),
        ),
      ),
      ...CollectionsRouter.configRoutes(coreModule.nextDatabase),
    ],
  );
}
