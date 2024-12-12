import 'package:equatable/equatable.dart';

class AlbumEntity extends Equatable {
  const AlbumEntity({
    this.id,
    this.artistName,
    this.collectionName,
    this.collectionViewUrl,
    this.artworkUrl60,
    this.trackCount,
    this.copyright,
    this.releaseDate,
    this.primaryGenreName,
  });

  final int? id;
  final String? artistName;
  final String? collectionName;
  final String? collectionViewUrl;
  final String? artworkUrl60;
  final int? trackCount;
  final String? copyright;
  final DateTime? releaseDate;
  final String? primaryGenreName;

  @override
  List<Object?> get props => [
        id,
        artistName,
        collectionName,
        collectionViewUrl,
        artworkUrl60,
        trackCount,
        copyright,
        releaseDate,
        primaryGenreName,
      ];
}
