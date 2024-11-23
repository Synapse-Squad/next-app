import '../core/use_case/params/album_delete_params.dart';
import '../core/use_case/use_case.dart';
import '../repositories/album_repository.dart';

final class DeleteAlbumUseCase extends AsyncUseCase<int, AlbumDeleteParams> {
  const DeleteAlbumUseCase(this.localAlbumRepository);

  final LocalAlbumRepository localAlbumRepository;

  @override
  Future<int> execute(AlbumDeleteParams param) {
    return localAlbumRepository.delete(param);
  }
}
