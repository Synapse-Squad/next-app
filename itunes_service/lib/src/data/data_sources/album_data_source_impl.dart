import 'package:rest_service/rest_service.dart';

import '../../core/exceptions/album_not_found_exception.dart';
import '../dtos/album_dto.dart';
import 'album_data_source.dart';

final class AlbumDataSourceImpl implements AlbumDataSource {
  const AlbumDataSourceImpl(this.client);

  final RestClient client;

  @override
  Future<List<AlbumDto>> searchForAlbum(String query) async {
    final response = await client.get(
      '/search',
      queryParameters: {
        'term': query,
        'entity': 'album',
        'limit': 10,
      },
    );

    final albums = response?['results'] as List<dynamic>?;

    if (response == null || albums == null || albums.isEmpty) {
      throw AlbumNotFoundException();
    }

    return albums.map((album) => AlbumDto.fromJson(album)).toList();
  }
}
