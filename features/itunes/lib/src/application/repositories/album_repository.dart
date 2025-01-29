import 'package:either/either.dart';

import '../entities/album_entity.dart';
import '../params/album_delete_params.dart';
import '../params/album_persisting_params.dart';

abstract interface class RemoteAlbumRepository {
  Future<Either<Failure, List<AlbumEntity>>> search(String query);
}

abstract interface class LocalAlbumRepository {
  Future<Either<Failure, int>> persist(AlbumPersistingParams params);
  Future<Either<Failure, int>> delete(AlbumDeleteParams params);
}
