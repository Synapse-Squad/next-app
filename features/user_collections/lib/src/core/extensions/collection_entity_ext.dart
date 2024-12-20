import 'package:drift/drift.dart';
import 'package:next_database_service/next_database_service.dart';

import '../../domain/entities/collection_entity.dart';

extension CollectionEntityExt on CollectionEntity {
  UserCollectionsCompanion toCompanion() {
    return UserCollectionsCompanion(
      title: Value(title),
      typeId: Value(type),
    );
  }
}

extension UserCollectionsExt on List<UserCollection> {
  List<CollectionEntity> toEntityList() {
    return map((collection) => collection.toEntity()).toList();
  }
}

extension UserCollectionExt on UserCollection {
  CollectionEntity toEntity() {
    return CollectionEntity(
      id: id,
      title: title,
      type: typeId,
      createdAt: createdAt,
    );
  }
}
