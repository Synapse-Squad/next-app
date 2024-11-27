import 'package:equatable/equatable.dart';

import '../entities/album_entity.dart';

final class AlbumPersistingParams extends Equatable {
  const AlbumPersistingParams({
    required this.categoryId,
    required this.album,
  });

  final int categoryId;
  final AlbumEntity album;

  @override
  List<Object?> get props => [categoryId, album];
}
