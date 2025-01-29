import 'package:next_database_service/next_database_service.dart';

import '../../application/entities/collection_mapper.dart';
import '../../application/use_cases/create_collection_use_case.dart';
import '../../application/use_cases/get_collections_use_case.dart';
import '../../data/data_sources/create_collection_data_source_impl.dart';
import '../../data/data_sources/get_collections_data_source_impl.dart';
import '../local/collection_db_mapper.dart';
import '../local/collection_local_data_gateway.dart';
import 'user_collections_module_dependencies.dart';

class UserCollectionsModuleFactory {
  const UserCollectionsModuleFactory(this.attachedDatabase);

  final NextDatabase attachedDatabase;

  UserCollectionsModuleDependencies create() {
    final collectionsDao = UserCollectionsDao(attachedDatabase);

    final collectionDataSourceLocal = CollectionLocalDataGateway(
      dao: collectionsDao,
      mapper: CollectionDbMapper(),
    );

    final createCollectionDataSource = CreateCollectionDataSourceImpl(
      collectionLocalSource: collectionDataSourceLocal,
    );

    final getCollectionsDataSource = GetCollectionsDataSourceImpl(
      collectionLocalSource: collectionDataSourceLocal,
    );

    final collectionMapper = CollectionMapper();

    final createCollectionUseCase = CreateCollectionUseCase(
      dataSource: createCollectionDataSource,
      mapper: collectionMapper,
    );

    final getCollectionsUseCase = GetCollectionsUseCase(
      dataSource: getCollectionsDataSource,
      mapper: collectionMapper,
    );

    return UserCollectionsModuleDependencies(
      userCollectionsDao: collectionsDao,
      collectionDataSourceLocal: collectionDataSourceLocal,
      createCollectionDataSource: createCollectionDataSource,
      getCollectionsDataSource: getCollectionsDataSource,
      createCollectionUseCase: createCollectionUseCase,
      getCollectionsUseCase: getCollectionsUseCase,
    );
  }
}
