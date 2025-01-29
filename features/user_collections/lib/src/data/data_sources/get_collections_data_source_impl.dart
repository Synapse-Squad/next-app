import 'package:next_database_service/next_database_service.dart';

import '../../application/data_sources/get_collections_data_source.dart';
import '../../application/entities/plain/collection_plain.dart';
import '../../core/mixins/data_source_exception_handler_mixin.dart';
import '../local/collection_data_source_local.dart';

/// it can combine multiple data providers - local, remote, etc.
final class GetCollectionsDataSourceImpl
    with DataSourceExceptionHandlerMixin
    implements GetCollectionsDataSource {
  const GetCollectionsDataSourceImpl({required this.collectionLocalSource});

  final CollectionDataSourceLocal collectionLocalSource;

  @override
  Future<List<CollectionPlain>> getCollections({
    CollectionTypes? type,
    OrderOptions? orderOptions,
  }) =>
      handleException(
        () => collectionLocalSource.getCollections(
          type: type,
          orderOptions: orderOptions,
        ),
      );
}
