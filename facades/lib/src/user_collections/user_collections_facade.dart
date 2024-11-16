import 'package:facades/src/user_collections/user_collection_mapper.dart';
import 'package:next_database_service/next_database_service.dart';

import 'user_collection_entity.dart';

abstract interface class IUserCollectionsFacade {
  Future<List<UserCollectionEntity>> getUserCollections({
    CollectionTypes? collectionType,
    OrderOptions orderOption = OrderOptions.newestFirst,
  });
}

final class UserCollectionsFacadeImpl implements IUserCollectionsFacade {
  const UserCollectionsFacadeImpl(this.userCollectionsDao);

  final UserCollectionsDao userCollectionsDao;

  @override
  Future<List<UserCollectionEntity>> getUserCollections({
    CollectionTypes? collectionType,
    OrderOptions? orderOption,
  }) async {
    final collectionRows = await userCollectionsDao.getCollections(
      collectionType: collectionType,
      orderOption: orderOption,
    );

    return UserCollectionMapper.toEntityList(collectionRows);
  }
}
