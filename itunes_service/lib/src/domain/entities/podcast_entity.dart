import '../../../itunes_service.dart';

class PodcastEntity {
  final String? artworkUrl600;
  final List<GenreEntity>? genres;
  final String? trackName;
  final String? shortDescription;
  final DateTime? releaseDate;
  final String? collectionViewUrl;
  final String? trackViewUrl;
  final int? trackTimeMillis;
  final String? collectionName;

  PodcastEntity({
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

  @override
  String toString() {
    return '''PodcastEntity(
    artworkUrl600: $artworkUrl600, 
    genres: $genres, 
    trackName: $trackName, 
    shortDescription: $shortDescription,
     releaseDate: $releaseDate, 
     collectionViewUrl: $collectionViewUrl, 
     trackViewUrl: $trackViewUrl, 
     trackTimeMillis: $trackTimeMillis, 
     collectionName: $collectionName)
     ''';
  }

  @override
  bool operator ==(covariant PodcastEntity other) {
    if (identical(this, other)) return true;

    return other.artworkUrl600 == artworkUrl600 &&
        other.genres == genres &&
        other.trackName == trackName &&
        other.shortDescription == shortDescription &&
        other.releaseDate == releaseDate &&
        other.collectionViewUrl == collectionViewUrl &&
        other.trackViewUrl == trackViewUrl &&
        other.trackTimeMillis == trackTimeMillis &&
        other.collectionName == collectionName;
  }

  @override
  int get hashCode {
    return artworkUrl600.hashCode ^
        genres.hashCode ^
        trackName.hashCode ^
        shortDescription.hashCode ^
        releaseDate.hashCode ^
        collectionViewUrl.hashCode ^
        trackViewUrl.hashCode ^
        trackTimeMillis.hashCode ^
        collectionName.hashCode;
  }
}
