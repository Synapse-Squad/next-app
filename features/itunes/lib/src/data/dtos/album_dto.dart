import 'package:equatable/equatable.dart';

class AlbumDto extends Equatable {
  const AlbumDto({
    this.wrapperType,
    this.collectionType,
    this.artistId,
    this.collectionId,
    this.artistName,
    this.collectionName,
    this.collectionCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionExplicitness,
    this.trackCount,
    this.copyright,
    this.country,
    this.currency,
    this.releaseDate,
    this.primaryGenreName,
  });

  factory AlbumDto.fromJson(Map<String, dynamic> json) {
    return AlbumDto(
      wrapperType: json['wrapperType'],
      collectionType: json['collectionType'],
      artistId: json['artistId'],
      collectionId: json['collectionId'],
      artistName: json['artistName'],
      collectionName: json['collectionName'],
      collectionCensoredName: json['collectionCensoredName'],
      artistViewUrl: json['artistViewUrl'],
      collectionViewUrl: json['collectionViewUrl'],
      artworkUrl60: json['artworkUrl60'],
      artworkUrl100: json['artworkUrl100'],
      collectionExplicitness: json['collectionExplicitness'],
      trackCount: json['trackCount'],
      copyright: json['copyright'],
      country: json['country'],
      currency: json['currency'],
      releaseDate: json['releaseDate'] != null
          ? DateTime.parse(json['releaseDate'])
          : null,
      primaryGenreName: json['primaryGenreName'],
    );
  }

  final String? wrapperType;
  final String? collectionType;
  final int? artistId;
  final int? collectionId;
  final String? artistName;
  final String? collectionName;
  final String? collectionCensoredName;
  final String? artistViewUrl;
  final String? collectionViewUrl;
  final String? artworkUrl60;
  final String? artworkUrl100;
  final String? collectionExplicitness;
  final int? trackCount;
  final String? copyright;
  final String? country;
  final String? currency;
  final DateTime? releaseDate;
  final String? primaryGenreName;

  @override
  List<Object?> get props => [
        wrapperType,
        collectionType,
        artistId,
        collectionId,
        artistName,
        collectionName,
        collectionCensoredName,
        artistViewUrl,
        collectionViewUrl,
        artworkUrl60,
        artworkUrl100,
        collectionExplicitness,
        trackCount,
        copyright,
        country,
        currency,
        releaseDate,
        primaryGenreName,
      ];
}
