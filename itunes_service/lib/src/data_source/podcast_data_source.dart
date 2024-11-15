import 'package:itunes_service/src/dtos/podcast_dto.dart';

abstract interface class PodcastDataSource {
  Future<List<PodcastDto>> searchForPodcast(String query);
}
