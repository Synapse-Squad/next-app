import 'package:flutter_test/flutter_test.dart';
import 'package:itunes_service/src/data/dtos/album_dto.dart';

import '../../file_reader/file_reader.dart';
import '../../mock/data/album.dart';

void main() {
  test('AlbumDto should parse the json successfully', () async {
    final albumJson = await FileReader.read(MockJsonPath.album);
    final parsedAlbum = AlbumDto.fromJson(albumJson);
    expect(parsedAlbum, mockAlbum);
  });
}
