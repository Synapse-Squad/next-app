import 'package:equatable/equatable.dart';

import '../entities/album_entity.dart';

final class AlbumDeleteParams extends Equatable {
  const AlbumDeleteParams({
    required this.album,
  });

  final AlbumEntity album;

  @override
  List<Object?> get props => [album];
}
