import 'dart:async';

import 'package:next_database_service/next_database_service.dart';

import '../../core/exceptions/user_collection_exceptions.dart';
import '../../core/extensions/collection_entity_ext.dart';
import '../../domain/entities/collection_entity.dart';
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
    CollectionTypes? type,
    OrderOptions? orderOptions,
  }) =>
      handleException(
        () async {
          final collections = await collectionsDao.getCollections(
            collectionType: type,
            orderOption: orderOptions,
          );

          return collections.toEntityList();
        },
      );

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
  Stream<List<CollectionEntity>> listenToCollections({
    CollectionTypes? type,
    OrderOptions? orderOptions,
  }) async* {
    try {
      // Listen to the DAO stream and yield each event
      await for (final collections in collectionsDao.watchCollections(
        collectionType: type,
        orderOption: orderOptions,
      )) {
        try {
          // Convert each collection to domain entity
          final domainCollections = collections.toEntityList();
          yield domainCollections;
        } catch (e) {
          // Handle conversion errors
          // throw DomainException(
          //   message: 'Error converting collection data',
          //   originalError: e,
          // );
        }
      }
    } catch (e) {
      // Convert DAO exceptions to domain exceptions
      // if (e is DatabaseException) {
      //   throw DomainException(
      //     message: 'Database error occurred',
      //     originalError: e,
      //   );
      // } else if (e is NetworkException) {
      //   throw DomainException(
      //     message: 'Network error occurred',
      //     originalError: e,
      //   );
      // } else {
      //   throw DomainException(
      //     message: 'Unexpected error occurred',
      //     originalError: e,
      //   );
      // }
    }
  }

  @override
  Future<CollectionEntity?> getCollectionOrNull({
    required String title,
    required CollectionTypes type,
  }) async {
    return handleException(() async {
      final collection = await collectionsDao.getCollection(
        title: title,
        collectionType: type,
      );
      return collection?.toEntity();
    });
  }
}
