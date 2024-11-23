import '../../../entities/album_entity.dart';
import '../use_case.dart';

final class AlbumDeleteParams extends Params {
  const AlbumDeleteParams({
    required this.album,
  });

  final AlbumEntity album;

  @override
  List<Object?> get props => [album];
}
