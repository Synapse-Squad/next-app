import 'package:domain/domain.dart';
import 'package:drift/drift.dart';

import '../tables/albums.drift.dart';

extension AlbumEntityExt on AlbumEntity {
  AlbumsCompanion toCompanion(int collectionId) {
    return AlbumsCompanion(
      artistName: Value(artistName),
      collectionName: Value(collectionName),
      collectionViewUrl: Value(collectionViewUrl),
      artworkUrl60: Value(artworkUrl60),
      trackCount: Value(trackCount),
      copyright: Value(copyright),
      releaseDate: Value(releaseDate),
      primaryGenreName: Value(primaryGenreName),
      collectionId: Value(collectionId),
    );
  }
}
