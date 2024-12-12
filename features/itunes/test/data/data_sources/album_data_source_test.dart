import 'package:flutter_test/flutter_test.dart';
import 'package:itunes/itunes_service.dart';
import 'package:itunes/src/core/exceptions/album_not_found_exception.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rest_service/rest_service.dart';
import 'package:testing_utils/testing_utils.dart';

import '../../mock/data/album.dart';
@GenerateNiceMocks([MockSpec<RestClient>()])
import 'album_data_source_test.mocks.dart';

void main() {
  late final MockRestClient restClient;
  late final AlbumDataSource albumDataSource;
  final expectedQueryParameters = {
    'entity': 'album',
    'limit': '10',
  };
  const query = 'the';

  setUpAll(
    () {
      restClient = MockRestClient();
      albumDataSource = AlbumDataSourceImpl(restClient);
    },
  );

  group(
    'AlbumDataSource',
    () {
      test(
        'should return list of [AlbumDto] in success case',
        () async {
          when(
            restClient.get(
              '/search',
              queryParameters: anyNamed('queryParameters'),
            ),
          ).thenAnswer(
            (_) async {
              final jsonData = await TestFileReader.read(
                'test/mock/jsons/albums.json',
              );
              return jsonData;
            },
          );

          final response = await albumDataSource.searchForAlbum(query);

          expect(response, mockAlbumDtos);
          expectedQueryParameters['term'] = query;
          verify(
            restClient.get(
              '/search',
              queryParameters: expectedQueryParameters,
            ),
          ).called(1);
          verifyNoMoreInteractions(restClient);
        },
      );

      test(
        'should return [AlbumNotFoundException] if there is no '
        'album item in search list',
        () async {
          when(
            restClient.get(
              '/search',
              queryParameters: anyNamed('queryParameters'),
            ),
          ).thenAnswer(
            (_) async {
              final jsonData = await TestFileReader.read(
                'test/mock/jsons/empty_result.json',
              );
              return jsonData;
            },
          );

          expect(
            () async => await albumDataSource.searchForAlbum(query),
            throwsA(isA<AlbumNotFoundException>()),
          );
          expectedQueryParameters['term'] = query;
          verify(
            restClient.get(
              '/search',
              queryParameters: expectedQueryParameters,
            ),
          ).called(1);
          verifyNoMoreInteractions(restClient);
        },
      );
    },
  );
}
