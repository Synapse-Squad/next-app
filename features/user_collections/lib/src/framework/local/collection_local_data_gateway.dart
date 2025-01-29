import 'package:next_database_service/next_database_service.dart';

import '../../application/entities/plain/collection_plain.dart';
import '../../core/mixins/gateway_exception_handler_mixin.dart';
import '../../data/local/collection_data_source_local.dart';
import 'collection_db_mapper.dart';

final class CollectionLocalDataGateway
    with GatewayExceptionHandlerMixin
    implements CollectionDataSourceLocal {
  const CollectionLocalDataGateway({
    required this.dao,
    required this.mapper,
  });

  final UserCollectionsDao dao;
  final CollectionDbMapper mapper;

  @override
  Future<List<CollectionPlain>> getCollections({
    CollectionTypes? type,
    OrderOptions? orderOptions,
  }) {
    return handle(
      () async {
        final collections = await dao.getCollections(
          collectionType: type,
          orderOption: orderOptions,
        );

        return collections.map(mapper.toPlain).toList();
      },
    );
  }

  @override
  Future<int> createCollection(CollectionPlain plain) {
    return handle(
      () async {
        final result = await dao.add(mapper.toCompanion(plain));
        return result;
      },
    );
  }

  @override
  Future<CollectionPlain?> getCollectionOrNull({
    required final String title,
    required final CollectionTypes type,
  }) {
    return handle(
      () async {
        final collection = await dao.getCollection(
          title: title,
          collectionType: type,
        );

        if (collection == null) return null;
        return mapper.toPlain(collection);
      },
    );
  }
}
