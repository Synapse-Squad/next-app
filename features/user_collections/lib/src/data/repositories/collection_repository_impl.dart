import 'package:next_database_service/next_database_service.dart';

import '../../core/extensions/collection_entity_ext.dart';
import '../../domain/entities/collection_entity.dart';
import '../../domain/params/create_collection_params.dart';
import '../../domain/params/get_collections_params.dart';
import '../../domain/repositories/collection_repository.dart';

final class CollectionRepositoryImpl implements CollectionRepository {
  const CollectionRepositoryImpl(this.collectionsDao);

  final UserCollectionsDao collectionsDao;

  @override
  Future<void> createCollection(CreateCollectionParams params) =>
      collectionsDao.add(params.toCompanion());

  @override
  Future<List<CollectionEntity>> getCollections({
    GetCollectionsParams? params,
  }) async {
    final collections = await collectionsDao.getCollections(
      collectionType: params?.type,
      orderOption: params?.orderOptions,
    );

    return collections.toEntityList();
  }
}
