import 'package:next_database_service/next_database_service.dart';

import '../../core/exceptions/user_collection_exceptions.dart';
import '../data_sources/get_collections_data_source.dart';
import '../entities/collection_entity.dart';
import '../entities/collection_mapper.dart';

final class GetCollectionsUseCase {
  const GetCollectionsUseCase({
    required this.dataSource,
    required this.mapper,
  });

  final GetCollectionsDataSource dataSource;
  final CollectionMapper mapper;

  Future<List<CollectionEntity>> call({
    CollectionTypes? type,
    OrderOptions? orderOptions,
  }) async {
    final collections = await dataSource.getCollections(
      type: type,
      orderOptions: orderOptions,
    );

    if (collections.isEmpty) {
      throw const CollectionsNotFoundException();
    }

    return mapper.toEntityList(collections);
  }
}
