import 'package:domain/domain.dart';

import '../daos/user_collections_dao.dart';
import '../extensions/collection_entity_ext.dart';

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
