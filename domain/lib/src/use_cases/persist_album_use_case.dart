import '../core/use_case/params/album_persisting_params.dart';
import '../core/use_case/use_case.dart';
import '../repositories/album_repository.dart';

final class PersistAlbumUseCase
    extends AsyncUseCase<int, AlbumPersistingParams> {
  const PersistAlbumUseCase(this.localAlbumRepository);

  final LocalAlbumRepository localAlbumRepository;

  @override
  Future<int> execute(AlbumPersistingParams param) {
    return localAlbumRepository.persist(param);
  }
}
