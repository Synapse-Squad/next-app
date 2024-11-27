import 'package:either/either.dart';

import '../entities/collection_entity.dart';
import '../params/get_collections_params.dart';
import '../repositories/collection_repository.dart';

final class GetCollectionsUseCase {
  const GetCollectionsUseCase(this.collectionRepository);

  final CollectionRepository collectionRepository;

  Future<Either<Failure, List<CollectionEntity>>> call(
    GetCollectionsParams? param,
  ) =>
      collectionRepository.getCollections(params: param);
}
