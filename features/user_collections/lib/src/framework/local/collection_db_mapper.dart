import 'package:drift/drift.dart';
import 'package:next_database_service/next_database_service.dart';

import '../../application/entities/plain/collection_plain.dart';

class CollectionDbMapper {
  CollectionPlain toPlain(UserCollection collection) {
    return CollectionPlain(
      id: collection.id,
      title: collection.title,
      type: collection.typeId,
      createdAt: collection.createdAt,
    );
  }

  UserCollectionsCompanion toCompanion(CollectionPlain plain) {
    return UserCollectionsCompanion(
      title: Value(plain.title),
      typeId: Value(plain.type),
    );
  }
}
