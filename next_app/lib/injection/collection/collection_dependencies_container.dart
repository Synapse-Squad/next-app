import 'package:domain/domain.dart';
import 'package:next_database_service/next_database_service.dart';

base class CollectionDependenciesContainer {
  const CollectionDependenciesContainer({
    required this.collectionsDao,
    required this.collectionRepository,
    required this.createCollectionUseCase,
    required this.getCollectionsUseCase,
  });

  final UserCollectionsDao collectionsDao;
  final CollectionRepository collectionRepository;
  final CreateCollectionUseCase createCollectionUseCase;
  final GetCollectionsUseCase getCollectionsUseCase;
}
