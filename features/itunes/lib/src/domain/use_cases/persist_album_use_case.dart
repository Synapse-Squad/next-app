import 'package:either/either.dart';

import '../params/album_persisting_params.dart';
import '../repositories/album_repository.dart';

final class PersistAlbumUseCase {
  const PersistAlbumUseCase(this.localAlbumRepository);

  final LocalAlbumRepository localAlbumRepository;

  Future<Either<Failure, int>> call(AlbumPersistingParams param) {
    return localAlbumRepository.persist(param);
  }
}
