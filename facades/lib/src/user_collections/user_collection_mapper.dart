import 'package:drift/drift.dart';
import 'package:next_database_service/next_database_service.dart';

import 'user_collection_entity.dart';

class UserCollectionMapper {
  const UserCollectionMapper._();

  static UserCollectionsCompanion toCompanion(UserCollectionEntity entity) {
    return UserCollectionsCompanion(
      title: Value(entity.title),
      typeId: Value(entity.type),
    );
  }

  static List<UserCollectionEntity> toEntityList(
    List<UserCollection> collections,
  ) {
    return collections.map(UserCollectionMapper.toEntity).toList();
  }

  static UserCollectionEntity toEntity(UserCollection collection) {
    return UserCollectionEntity(
      id: collection.id,
      title: collection.title,
      type: collection.typeId,
      createdAt: collection.createdAt,
    );
  }
}
