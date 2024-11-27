import 'package:flutter_test/flutter_test.dart';
import 'package:itunes_service/src/data/dtos/album_dto.dart';
import 'package:testing_utils/testing_utils.dart';

import '../../mock/data/album.dart';

void main() {
  test('AlbumDto should parse the json successfully', () async {
    final albumJson = await TestFileReader.read('test/mock/jsons/album.json');
    final parsedAlbum = AlbumDto.fromJson(albumJson);
    expect(parsedAlbum, mockAlbumDto);
  });
}
