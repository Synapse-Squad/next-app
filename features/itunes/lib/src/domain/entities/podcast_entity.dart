import 'package:equatable/equatable.dart';

import 'genre_entity.dart';

class PodcastEntity extends Equatable {
  const PodcastEntity({
    this.artworkUrl600,
    this.genres,
    this.trackName,
    this.shortDescription,
    this.releaseDate,
    this.collectionViewUrl,
    this.trackViewUrl,
    this.trackTimeMillis,
    this.collectionName,
  });

  final String? artworkUrl600;
  final List<GenreEntity>? genres;
  final String? trackName;
  final String? shortDescription;
  final DateTime? releaseDate;
  final String? collectionViewUrl;
  final String? trackViewUrl;
  final int? trackTimeMillis;
  final String? collectionName;

  @override
  List<Object?> get props => [
        artworkUrl600,
        genres,
        trackName,
        shortDescription,
        releaseDate,
        collectionViewUrl,
        trackViewUrl,
        trackTimeMillis,
        collectionName,
      ];
}
