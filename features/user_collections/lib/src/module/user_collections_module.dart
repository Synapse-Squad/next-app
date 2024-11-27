import '../domain/use_cases/create_collection_use_case.dart';
import '../domain/use_cases/get_collections_use_case.dart';

base class UserCollectionsModule {
  const UserCollectionsModule({
    required this.createCollectionUseCase,
    required this.getCollectionsUseCase,
  });

  final CreateCollectionUseCase createCollectionUseCase;
  final GetCollectionsUseCase getCollectionsUseCase;
}
