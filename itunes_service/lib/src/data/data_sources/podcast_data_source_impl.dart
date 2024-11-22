import 'package:rest_service/rest_service.dart';

import '../../../itunes_service.dart';
import '../dtos/podcast_dto.dart';

final class PodcastDataSourceImpl implements PodcastDataSource {
  PodcastDataSourceImpl(this.client);

  final HttpRestClient client;

  @override
  Future<List<PodcastDto>> searchForPodcast(String query) async {
    final response = await client.get(
      '/search',
      queryParameters: {
        'term': query,
        'entity': 'podcastEpisode',
        'limit': '10',
      },
    );

    final podcasts = response?['results'] as List<dynamic>?;

    if (response == null || podcasts == null || podcasts.isEmpty) {
      throw PodcastNotFoundException();
    }

    return podcasts
        .map(
          (podcast) => PodcastDto.fromJson(podcast),
        )
        .toList();
  }
}
