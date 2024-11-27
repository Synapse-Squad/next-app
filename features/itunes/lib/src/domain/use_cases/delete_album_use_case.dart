import '../params/album_delete_params.dart';
import '../repositories/album_repository.dart';

final class DeleteAlbumUseCase {
  const DeleteAlbumUseCase(this.localAlbumRepository);

  final LocalAlbumRepository localAlbumRepository;

  Future<int> call(AlbumDeleteParams param) {
    return localAlbumRepository.delete(param);
  }
}
