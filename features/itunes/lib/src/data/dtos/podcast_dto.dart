class PodcastDto {
  final String? artworkUrl600;
  final String? episodeContentType;
  final String? artworkUrl160;
  final List<dynamic>? artistIds;
  final String? episodeUrl;
  final String? collectionViewUrl;
  final int? trackTimeMillis;
  final DateTime? releaseDate;
  final String? shortDescription;
  final int? trackId;
  final String? trackName;
  final String? feedUrl;
  final String? closedCaptioning;
  final int? collectionId;
  final String? collectionName;
  final String? previewUrl;
  final String? kind;
  final String? wrapperType;
  final String? description;
  final String? country;
  final String? contentAdvisoryRating;
  final String? trackViewUrl;
  final String? episodeFileExtension;
  final String? artworkUrl60;
  final List<GenreDto>? genres;
  final String? episodeGuid;

  PodcastDto({
    this.artworkUrl600,
    this.episodeContentType,
    this.artworkUrl160,
    this.artistIds,
    this.episodeUrl,
    this.collectionViewUrl,
    this.trackTimeMillis,
    this.releaseDate,
    this.shortDescription,
    this.trackId,
    this.trackName,
    this.feedUrl,
    this.closedCaptioning,
    this.collectionId,
    this.collectionName,
    this.previewUrl,
    this.kind,
    this.wrapperType,
    this.description,
    this.country,
    this.contentAdvisoryRating,
    this.trackViewUrl,
    this.episodeFileExtension,
    this.artworkUrl60,
    this.genres,
    this.episodeGuid,
  });

  factory PodcastDto.fromJson(Map<String, dynamic> json) {
    return PodcastDto(
      artworkUrl600: json['artworkUrl600'],
      episodeContentType: json['episodeContentType'],
      artworkUrl160: json['artworkUrl160'],
      artistIds: json['artistIds'] != null
          ? List<dynamic>.from((json['artistIds'] as List<dynamic>))
          : null,
      episodeUrl: json['episodeUrl'],
      collectionViewUrl: json['collectionViewUrl'],
      trackTimeMillis: json['trackTimeMillis'],
      releaseDate: json['releaseDate'] != null
          ? DateTime.parse(json['releaseDate'])
          : null,
      shortDescription: json['shortDescription'],
      trackId: json['trackId'],
      trackName: json['trackName'],
      feedUrl: json['feedUrl'],
      closedCaptioning: json['closedCaptioning'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      previewUrl: json['previewUrl'],
      kind: json['kind'],
      wrapperType: json['wrapperType'],
      description: json['description'],
      country: json['country'],
      contentAdvisoryRating: json['contentAdvisoryRating'],
      trackViewUrl: json['trackViewUrl'],
      episodeFileExtension: json['episodeFileExtension'],
      artworkUrl60: json['artworkUrl60'],
      genres: json['genres'] != null
          ? List<GenreDto>.from(
              (json['genres'] as List<dynamic>).map(
                (genre) => GenreDto.fromJson(genre as Map<String, dynamic>),
              ),
            )
          : null,
      episodeGuid: json['episodeGuid'],
    );
  }
}

class GenreDto {
  String? name;
  String? id;
  GenreDto({
    this.name,
    this.id,
  });

  factory GenreDto.fromJson(Map<String, dynamic> json) {
    return GenreDto(
      name: json['name'],
      id: json['id'],
    );
  }
}
