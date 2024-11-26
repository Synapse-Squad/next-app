import 'package:go_router/go_router.dart';

import 'routes.dart';

final router = GoRouter(
  initialLocation: CollectionsRoute().location,
  routes: $appRoutes,
);
