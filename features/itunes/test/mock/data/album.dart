import 'package:itunes/src/data/dtos/album_dto.dart';
import 'package:itunes/src/domain/entities/album_entity.dart';

final mockAlbumDto = AlbumDto(
  wrapperType: 'collection',
  collectionType: 'Album',
  artistId: 160343465,
  collectionId: 1687957417,
  artistName: 'Dima Bilan',
  collectionName: 'Вторая жизнь',
  collectionCensoredName: 'Вторая жизнь',
  artistViewUrl: 'https://music.apple.com/us/artist/dima-bilan/160343465?uo=4',
  collectionViewUrl:
      'https://music.apple.com/us/album/%D0%B2%D1%82%D0%BE%D1%80%D0%B0%D1%8F'
      '-%D0%B6%D0%B8%D0%B7%D0%BD%D1%8C/1687957417?uo=4',
  artworkUrl60: 'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/41/14/'
      'a1/4114a10f-c4d3-19ae-5e70-1fd70be43a0e/cover.jpg/60x60bb.jpg',
  artworkUrl100: 'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/41/'
      '14/a1/4114a10f-c4d3-19ae-5e70-1fd70be43a0e/cover.jpg/100x100bb.jpg',
  collectionExplicitness: 'notExplicit',
  trackCount: 11,
  copyright: '℗ 2020 Archer Music Production LLC',
  country: 'USA',
  currency: 'USD',
  releaseDate: DateTime.parse('2020-12-15T08:00:00Z'),
  primaryGenreName: 'Pop',
);

final mockAlbumDtos = [mockAlbumDto];

final mockAlbumEntities = [
  AlbumEntity(
    id: 1687957417,
    artistName: 'Dima Bilan',
    collectionName: 'Вторая жизнь',
    collectionViewUrl:
        'https://music.apple.com/us/album/%D0%B2%D1%82%D0%BE%D1%80%D0%B0%D1%8F'
        '-%D0%B6%D0%B8%D0%B7%D0%BD%D1%8C/1687957417?uo=4',
    artworkUrl60: 'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/41/14/'
        'a1/4114a10f-c4d3-19ae-5e70-1fd70be43a0e/cover.jpg/60x60bb.jpg',
    trackCount: 11,
    copyright: '℗ 2020 Archer Music Production LLC',
    releaseDate: DateTime.parse('2020-12-15T08:00:00Z'),
    primaryGenreName: 'Pop',
  ),
];
