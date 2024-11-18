class GoogleBookDto {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfoDto? volumeInfo;

  GoogleBookDto({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
  });

  factory GoogleBookDto.fromMap(Map<String, dynamic> map) {
    return GoogleBookDto(
      kind: map['kind'],
      id: map['id'],
      etag: map['etag'],
      selfLink: map['selfLink'],
      volumeInfo: map['volumeInfo'] != null
          ? VolumeInfoDto.fromMap(map['volumeInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

class VolumeInfoDto {
  final String? title;
  final List<String>? authors;
  final DateTime? publishedDate;
  final int? pageCount;
  final String? printType;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final ImageLinkDto? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;
  final String? subtitle;
  final String? publisher;
  final String? description;
  final List<String>? categories;
  final int? averageRating;
  final int? ratingsCount;

  VolumeInfoDto({
    this.title,
    this.authors,
    this.publishedDate,
    this.pageCount,
    this.printType,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.subtitle,
    this.publisher,
    this.description,
    this.categories,
    this.averageRating,
    this.ratingsCount,
  });

  factory VolumeInfoDto.fromMap(Map<String, dynamic> map) {
    return VolumeInfoDto(
      title: map['title'],
      authors: map['authors'] != null
          ? List<String>.from((map['authors'] as List<dynamic>))
          : null,
      publishedDate: map['publishedDate'],
      pageCount: map['pageCount'],
      printType: map['printType'],
      maturityRating: map['maturityRating'],
      allowAnonLogging: map['allowAnonLogging'],
      contentVersion: map['contentVersion'],
      imageLinks: map['imageLinks'] != null
          ? ImageLinkDto.fromMap(map['imageLinks'] as Map<String, dynamic>)
          : null,
      language: map['language'],
      previewLink: map['previewLink'],
      infoLink: map['infoLink'],
      canonicalVolumeLink: map['canonicalVolumeLink'],
      subtitle: map['subtitle'],
      publisher: map['publisher'],
      description: map['description'],
      categories: map['categories'] != null
          ? List<String>.from((map['categories'] as List<dynamic>))
          : null,
      averageRating: map['averageRating'],
      ratingsCount: map['ratingsCount'],
    );
  }
}

class ImageLinkDto {
  final String? smallThumbnail;
  final String? thumbnail;
  ImageLinkDto({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLinkDto.fromMap(Map<String, dynamic> map) {
    return ImageLinkDto(
      smallThumbnail: map['smallThumbnail'],
      thumbnail: map['thumbnail'],
    );
  }
}
