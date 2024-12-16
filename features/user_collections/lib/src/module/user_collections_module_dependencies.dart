import 'package:next_database_service/next_database_service.dart';

import '../domain/repositories/collection_repository.dart';
import '../domain/use_cases/create_collection_use_case.dart';
import '../domain/use_cases/get_collections_use_case.dart';

base class UserCollectionsModuleDependencies {
  const UserCollectionsModuleDependencies({
    required this.userCollectionsDao,
    required this.createCollectionUseCase,
    required this.getCollectionsUseCase,
    required this.collectionRepository,
  });

  final UserCollectionsDao userCollectionsDao;
  final CollectionRepository collectionRepository;
  final CreateCollectionUseCase createCollectionUseCase;
  final GetCollectionsUseCase getCollectionsUseCase;

}
