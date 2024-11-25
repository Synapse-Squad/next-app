import '../core/use_case/params/create_collection_params.dart';
import '../core/use_case/use_case.dart';
import '../repositories/collection_repository.dart';

final class CreateCollectionUseCase
    extends AsyncUseCase<void, CreateCollectionParams> {
  const CreateCollectionUseCase(this.collectionRepository);

  final CollectionRepository collectionRepository;

  @override
  Future<void> execute(CreateCollectionParams param) =>
     collectionRepository.createCollection(param);
}
