import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:itunes/itunes_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock/data/album.dart';
@GenerateNiceMocks([MockSpec<AlbumDataSource>()])
import 'remote_album_repository_test.mocks.dart';

void main() {
  late final MockAlbumDataSource dataSource;
  late final RemoteAlbumRepository repository;

  setUpAll(() {
    dataSource = MockAlbumDataSource();
    repository = RemoteAlbumRepositoryImpl(albumDataSource: dataSource);
  });

  group(
    'RemoteAlbumRepository',
    () {
      test(
        'should return list of [AlbumEntity] in success case',
        () async {
          when(dataSource.searchForAlbum(any)).thenAnswer(
            (_) async => mockAlbumDtos,
          );

          final response = await repository.search('the');

          expect(response, mockAlbumEntities);
          verify(dataSource.searchForAlbum('the')).called(1);
          verifyNoMoreInteractions(dataSource);
        },
      );
    },
  );
}
