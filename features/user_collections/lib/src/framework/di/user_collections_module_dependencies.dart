import 'package:next_database_service/next_database_service.dart';

import '../../application/data_sources/create_collection_data_source.dart';
import '../../application/data_sources/get_collections_data_source.dart';
import '../../application/use_cases/create_collection_use_case.dart';
import '../../application/use_cases/get_collections_use_case.dart';
import '../../data/local/collection_data_source_local.dart';

base class UserCollectionsModuleDependencies {
  const UserCollectionsModuleDependencies({
    required this.userCollectionsDao,
    required this.collectionDataSourceLocal,
    required this.createCollectionDataSource,
    required this.getCollectionsDataSource,
    required this.createCollectionUseCase,
    required this.getCollectionsUseCase,
  });

  final UserCollectionsDao userCollectionsDao;
  final CollectionDataSourceLocal collectionDataSourceLocal;
  final CreateCollectionDataSource createCollectionDataSource;
  final GetCollectionsDataSource getCollectionsDataSource;
  final CreateCollectionUseCase createCollectionUseCase;
  final GetCollectionsUseCase getCollectionsUseCase;
}
