import 'package:itunes_service/src/entities/podcast_entity.dart';

import '../entities/album_entity.dart';

abstract interface class ItunesRepository {
  Future<List<AlbumEntity>> searchForAlbum(String query);
  Future<List<PodcastEntity>> searchForPodcast(String query);
}
