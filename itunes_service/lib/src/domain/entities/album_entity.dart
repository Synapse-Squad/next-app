class AlbumEntity {
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
  String toString() {
    return '''AlbumEntity(
    id: $id,
    artistName: $artistName,
    trackCount: $trackCount,
    releaseData: $releaseDate,
    primaryGenreName: $primaryGenreName,
    )''';
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        artistName,
        collectionName,
        collectionViewUrl,
        artworkUrl60,
        trackCount,
        copyright,
        releaseDate,
        primaryGenreName,
      ]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumEntity &&
          id == other.id &&
          artistName == other.artistName &&
          collectionName == other.collectionName &&
          collectionViewUrl == other.collectionViewUrl &&
          artworkUrl60 == other.artworkUrl60 &&
          trackCount == other.trackCount &&
          copyright == other.copyright &&
          releaseDate == other.releaseDate &&
          primaryGenreName == other.primaryGenreName;
}
