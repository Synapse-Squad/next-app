import '../../../entities/album_entity.dart';
import '../use_case.dart';

final class AlbumPersistingParams extends Params {
  const AlbumPersistingParams({
    required this.categoryId,
    required this.album,
  });

  final int categoryId;
  final AlbumEntity album;

  @override
  List<Object?> get props => [categoryId, album];
}
