import 'package:flutter/foundation.dart';
import 'package:rest_service/rest_service.dart';

import '../dtos/album_dto.dart';
import '../exceptions/album_not_found_exception.dart';
import 'album_data_source.dart';

/// base-url: https://itunes.apple.com
final class AlbumDataSourceImpl implements AlbumDataSource {
  const AlbumDataSourceImpl(this.client);

  final HttpRestClient client;

  @override
  Future<List<AlbumDto>> searchForAlbum(String query) async {
    final response = await client.get(
      '/search',
      queryParameters: {
        'term': query,
        'entity': 'album',
      },
    );

    final albums = response?['results'] as List<dynamic>?;

    if (response == null || albums == null || albums.isEmpty) {
      throw AlbumNotFoundException();
    }

    return albums.map((album) => AlbumDto.fromJson(album)).toList();
  }
}
