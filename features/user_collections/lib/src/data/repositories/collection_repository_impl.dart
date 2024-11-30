import 'package:either/either.dart';
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
  Future<Either<Failure, Unit>> createCollection(
    CollectionParams params,
  ) async {
    try {
      await collectionsDao.add(params.toCompanion());
      return const Right(unit);
    } catch (_) {
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<CollectionEntity>>> getCollections({
    GetCollectionsParams? params,
  }) async {
    try {
      final collections = await collectionsDao.getCollections(
        collectionType: params?.type,
        orderOption: params?.orderOptions,
      );

      return Right(collections.toEntityList());
    } catch (_) {
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, CollectionEntity?>> getCollection(
    CollectionParams params,
  ) async {
    try {
      final collection = await collectionsDao.getCollection(
        title: params.title,
        collectionType: params.type,
      );

      print('collection: $collection');

      return Right(collection?.toEntity());
    } catch (_) {
      return Left(Failure.database());
    }
  }
}
