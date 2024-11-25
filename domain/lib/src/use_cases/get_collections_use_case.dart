import '../core/use_case/params/get_collections_params.dart';
import '../core/use_case/use_case.dart';
import '../entities/collection_entity.dart';
import '../repositories/collection_repository.dart';

final class GetCollectionsUseCase
    extends AsyncUseCase<List<CollectionEntity>, GetCollectionsParams> {
  const GetCollectionsUseCase(this.collectionRepository);

  final CollectionRepository collectionRepository;

  @override
  Future<List<CollectionEntity>> execute(GetCollectionsParams? param) =>
      collectionRepository.getCollections(params: param);
}
