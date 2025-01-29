import 'package:next_database_service/next_database_service.dart';

import '../../core/exceptions/user_collection_exceptions.dart';
import '../data_sources/create_collection_data_source.dart';
import '../entities/collection_mapper.dart';

final class CreateCollectionUseCase {
  const CreateCollectionUseCase({
    required this.dataSource,
    required this.mapper,
  });

  final CreateCollectionDataSource dataSource;
  final CollectionMapper mapper;

  Future<int> call({
    required final String title,
    required final CollectionTypes type,
  }) async {
    final collection = await dataSource.getCollectionOrNull(
      title: title,
      type: type,
    );

    if (collection != null) {
      throw const SameCollectionFoundException();
    }

    final entity = mapper.toEntity(collection!);
    return dataSource.createCollection(mapper.toPlain(entity));
  }
}
