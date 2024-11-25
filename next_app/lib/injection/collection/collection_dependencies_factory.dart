import 'package:domain/domain.dart';
import 'package:next_database_service/next_database_service.dart';

import '../factories.dart';
import '../global/dependencies_container.dart';
import 'collection_dependencies_container.dart';

final class CollectionDependenciesFactory
    extends Factory<CollectionDependenciesContainer> {
  CollectionDependenciesFactory(this.dependencies);

  final DependenciesContainer dependencies;

  @override
  CollectionDependenciesContainer create() {
    final collectionDao = UserCollectionsDao(dependencies.nextDatabase);
    final collectionRepository = CollectionRepositoryImpl(collectionDao);
    final createUseCase = CreateCollectionUseCase(collectionRepository);
    final getListUseCase = GetCollectionsUseCase(collectionRepository);

    return CollectionDependenciesContainer(
      collectionsDao: collectionDao,
      collectionRepository: collectionRepository,
      createCollectionUseCase: createUseCase,
      getCollectionsUseCase: getListUseCase,
    );
  }
}
