import 'package:next_database_service/next_database_service.dart';

import '../data/repositories/collection_repository_impl.dart';
import '../domain/use_cases/create_collection_use_case.dart';
import '../domain/use_cases/get_collections_use_case.dart';
import 'user_collections_module_dependencies.dart';

class UserCollectionsModuleFactory {
  const UserCollectionsModuleFactory(this.attachedDatabase);

  final NextDatabase attachedDatabase;

  UserCollectionsModuleDependencies create() {
    final collectionsDao = UserCollectionsDao(attachedDatabase);
    final collectionRepository = CollectionRepositoryImpl(collectionsDao);
    final createCollectionUseCase = CreateCollectionUseCase(
      collectionRepository,
    );
    final getCollectionsUseCase = GetCollectionsUseCase(
      collectionRepository,
    );

    return UserCollectionsModuleDependencies(
      userCollectionsDao: collectionsDao,
      createCollectionUseCase: createCollectionUseCase,
      getCollectionsUseCase: getCollectionsUseCase,
      collectionRepository: collectionRepository,
    );
  }
}
