import 'collection_entity.dart';
import 'plain/collection_plain.dart';

class CollectionMapper {
  CollectionPlain toPlain(CollectionEntity entity) {
    return CollectionPlain(
      id: entity.id,
      title: entity.title,
      type: entity.type,
      createdAt: entity.createdAt,
    );
  }

  List<CollectionEntity> toEntityList(List<CollectionPlain> plain) {
    return plain
        .map((e) => CollectionEntity(
              id: e.id!,
              title: e.title,
              type: e.type,
              createdAt: e.createdAt,
            ))
        .toList();
  }

  CollectionEntity toEntity(CollectionPlain plain) {
    return CollectionEntity.create(
      title: plain.title,
      type: plain.type,
      createdAt: plain.createdAt,
    );
  }
}
