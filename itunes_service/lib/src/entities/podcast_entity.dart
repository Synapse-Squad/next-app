class PodcastEntity {
  String? artworkUrl600;
  String? genreName;
  String? trackName;
  String? shortDescription;
  DateTime? releaseDate;
  String? collectionViewUrl;
  String? trackViewUrl;
  int? trackTimeMillis;
  String? collectionName;

  PodcastEntity({
    this.artworkUrl600,
    this.genreName,
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
    genreName: $genreName, 
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
        other.genreName == genreName &&
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
        genreName.hashCode ^
        trackName.hashCode ^
        shortDescription.hashCode ^
        releaseDate.hashCode ^
        collectionViewUrl.hashCode ^
        trackViewUrl.hashCode ^
        trackTimeMillis.hashCode ^
        collectionName.hashCode;
  }
}
