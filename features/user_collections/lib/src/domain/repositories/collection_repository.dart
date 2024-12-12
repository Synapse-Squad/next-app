import 'package:either/either.dart';

import '../entities/collection_entity.dart';
import '../params/create_collection_params.dart';
import '../params/get_collections_params.dart';

abstract interface class CollectionRepository {
  Future<Either<Failure, Unit>> createCollection(
    CollectionParams params,
  );

  Future<Either<Failure, List<CollectionEntity>>> getCollections({
    GetCollectionsParams? params,
  });

  Future<Either<Failure, CollectionEntity?>> getCollection(
    CollectionParams params,
  );
}
