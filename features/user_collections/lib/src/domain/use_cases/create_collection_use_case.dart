import 'package:either/either.dart';

import '../../core/enums/same_collection_found_failure.dart';
import '../params/create_collection_params.dart';
import '../repositories/collection_repository.dart';

final class CreateCollectionUseCase {
  const CreateCollectionUseCase(this.collectionRepository);

  final CollectionRepository collectionRepository;

  Future<Either<Failure, Unit>> call(CollectionParams param) async {
    final collection = await collectionRepository.getCollection(param);

    if (collection.isRight() || collection.getRight() != null) {
      return const Left(SameCollectionFoundFailure());
    }

    return collectionRepository.createCollection(param);
  }
}
