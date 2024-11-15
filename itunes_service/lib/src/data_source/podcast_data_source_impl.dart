import 'package:itunes_service/src/data_source/podcast_data_source.dart';
import 'package:itunes_service/src/dtos/podcast_dto.dart';
import 'package:itunes_service/src/exceptions/podcast_not_found_exception.dart';
import 'package:rest_service/rest_service.dart';

final class PodcastDataSourceImpl implements PodcastDataSource {
  final HttpRestClient client;

  PodcastDataSourceImpl({required this.client});

  @override
  Future<List<PodcastDto>> searchForPodcast(String query) async {
    final response = await client.get(
      'itunes.apple.com/search',
      queryParameters: {
        'term': query,
        'entity': 'podcastEpisode',
        'limit': 10,
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
