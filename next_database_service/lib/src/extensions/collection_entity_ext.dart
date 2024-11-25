import 'package:domain/domain.dart';
import 'package:drift/drift.dart';

import '../tables/user_collections.drift.dart';

extension CollectionEntityExt on CreateCollectionParams {
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
