import '../core/use_case/params/album_delete_params.dart';
import '../core/use_case/params/album_persisting_params.dart';
import '../entities/album_entity.dart';

abstract interface class RemoteAlbumRepository {
  Future<List<AlbumEntity>> search(String query);
}

abstract interface class LocalAlbumRepository {
  Future<int> persist(AlbumPersistingParams params);
  Future<int> delete(AlbumDeleteParams params);
}
