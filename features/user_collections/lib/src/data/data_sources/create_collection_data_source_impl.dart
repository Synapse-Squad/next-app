import 'package:next_database_service/next_database_service.dart';

import '../../application/data_sources/create_collection_data_source.dart';
import '../../application/entities/plain/collection_plain.dart';
import '../../core/mixins/data_source_exception_handler_mixin.dart';
import '../local/collection_data_source_local.dart';

final class CreateCollectionDataSourceImpl
    with DataSourceExceptionHandlerMixin
    implements CreateCollectionDataSource {
  const CreateCollectionDataSourceImpl({required this.collectionLocalSource});

  final CollectionDataSourceLocal collectionLocalSource;

  @override
  Future<int> createCollection(CollectionPlain plain) => handleException<int>(
        () => collectionLocalSource.createCollection(plain),
      );

  @override
  Future<CollectionPlain?> getCollectionOrNull({
    required final String title,
    required final CollectionTypes type,
  }) =>
      handleException(
        () => collectionLocalSource.getCollectionOrNull(
          title: title,
          type: type,
        ),
      );
}
