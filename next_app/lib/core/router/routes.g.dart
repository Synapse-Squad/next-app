// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $collectionsRoute,
      $createCollectionsRoute,
    ];

RouteBase get $collectionsRoute => GoRouteData.$route(
      path: '/collections',
      factory: $CollectionsRouteExtension._fromState,
    );

extension $CollectionsRouteExtension on CollectionsRoute {
  static CollectionsRoute _fromState(GoRouterState state) =>
      const CollectionsRoute();

  String get location => GoRouteData.$location(
        '/collections',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createCollectionsRoute => GoRouteData.$route(
      path: '/create-collection',
      factory: $CreateCollectionsRouteExtension._fromState,
    );

extension $CreateCollectionsRouteExtension on CreateCollectionsRoute {
  static CreateCollectionsRoute _fromState(GoRouterState state) =>
      CreateCollectionsRoute(
        state.extra as ({
          CollectionsBloc collectionsBloc,
          CreateCollectionUseCase createCollectionUseCase
        }),
      );

  String get location => GoRouteData.$location(
        '/create-collection',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
