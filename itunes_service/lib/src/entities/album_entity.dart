class AlbumEntity {
  const AlbumEntity({
    this.artistName,
    this.collectionName,
    this.collectionViewUrl,
    this.artworkUrl60,
    this.trackCount,
    this.copyright,
    this.releaseDate,
    this.primaryGenreName,
  });

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
    artistName: $artistName,
    trackCount: $trackCount,
    releaseData: $releaseDate,
    primaryGenreName: $primaryGenreName,
    )''';
  }
}
