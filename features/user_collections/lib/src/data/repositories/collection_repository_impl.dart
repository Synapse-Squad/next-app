import 'dart:async';

import 'package:next_database_service/next_database_service.dart';

import '../../core/exceptions/user_collection_exceptions.dart';
import '../../core/extensions/collection_entity_ext.dart';
import '../../domain/entities/collection_entity.dart';
import '../../domain/params/create_collection_params.dart';
import '../../domain/params/get_collections_params.dart';
import '../../domain/repositories/collection_repository.dart';

final class CollectionRepositoryImpl implements CollectionRepository {
  const CollectionRepositoryImpl(this.collectionsDao);

  final UserCollectionsDao collectionsDao;

  @override
  Future<int> createCollection(CollectionEntity entity) {
    return handleException<int>(
      () {
        return collectionsDao.add(entity.toCompanion());
      },
    );
  }

  @override
  Future<List<CollectionEntity>> getCollections({
    GetCollectionsParams? params,
  }) =>
      handleException(
        () async {
          final collections = await collectionsDao.getCollections(
            collectionType: params?.type,
            orderOption: params?.orderOptions,
          );

          return collections.toEntityList();
        },
      );

  @override
  Future<CollectionEntity> getCollection(
    CollectionParams params,
  ) {
    return handleException(
      () async {
        final collection = await collectionsDao.getCollection(
          title: params.title,
          collectionType: params.type,
        );

        if (collection == null) {
          throw const CollectionNotFoundException();
        }

        return collection.toEntity();
      },
    );
  }

  Future<T> handleException<T>(Future<T> Function() expression) async {
    try {
      return await expression();
    } on DatabaseException catch (error, stackTrace) {
      Error.throwWithStackTrace(
        UserCollectionException(error.message),
        stackTrace,
      );
    } catch (error) {
      throw UserCollectionException(error.toString());
    }
  }

  @override
  Future<CollectionEntity?> getCollectionOrNull(CollectionParams params) async {
    return handleException(() async {
      final collection = await collectionsDao.getCollection(
        title: params.title,
        collectionType: params.type,
      );
      return collection?.toEntity();
    });
  }
}
