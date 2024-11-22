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

  factory GoogleBookDto.fromJson(Map<String, dynamic> json) {
    return GoogleBookDto(
      kind: json['kind'],
      id: json['id'],
      etag: json['etag'],
      selfLink: json['selfLink'],
      volumeInfo: json['volumeInfo'] != null
          ? VolumeInfoDto.fromJson(json['volumeInfo'] as Map<String, dynamic>)
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

  factory VolumeInfoDto.fromJson(Map<String, dynamic> json) {
    return VolumeInfoDto(
      title: json['title'],
      authors: json['authors'] != null
          ? List<String>.from((json['authors'] as List<dynamic>))
          : null,
      publishedDate: json['publishedDate'],
      pageCount: json['pageCount'],
      printType: json['printType'],
      maturityRating: json['maturityRating'],
      allowAnonLogging: json['allowAnonLogging'],
      contentVersion: json['contentVersion'],
      imageLinks: json['imageLinks'] != null
          ? ImageLinkDto.fromJson(json['imageLinks'] as Map<String, dynamic>)
          : null,
      language: json['language'],
      previewLink: json['previewLink'],
      infoLink: json['infoLink'],
      canonicalVolumeLink: json['canonicalVolumeLink'],
      subtitle: json['subtitle'],
      publisher: json['publisher'],
      description: json['description'],
      categories: json['categories'] != null
          ? List<String>.from((json['categories'] as List<dynamic>))
          : null,
      averageRating: json['averageRating'],
      ratingsCount: json['ratingsCount'],
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

  factory ImageLinkDto.fromJson(Map<String, dynamic> json) {
    return ImageLinkDto(
      smallThumbnail: json['smallThumbnail'],
      thumbnail: json['thumbnail'],
    );
  }
}
