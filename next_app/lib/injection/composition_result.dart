import 'package:next_app/injection/global/dependencies_container.dart';

class CompositionResult {
  const CompositionResult({
    required this.dependencies,
  });

  final DependenciesContainer dependencies;
}
