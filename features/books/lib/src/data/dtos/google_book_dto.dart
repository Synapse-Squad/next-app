import 'package:equatable/equatable.dart';

class GoogleBookDto extends Equatable {
  const GoogleBookDto({
    this.kind,
    this.id,
    this.volumeInfo,
  });

  final String? kind;
  final String? id;
  final VolumeInfoDto? volumeInfo;

  factory GoogleBookDto.fromJson(Map<String, dynamic> json) {
    return GoogleBookDto(
      kind: json['kind'],
      id: json['id'],
      volumeInfo: json['volumeInfo'] != null
          ? VolumeInfoDto.fromJson(json['volumeInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [kind, id, volumeInfo];

  @override
  bool? get stringify => true;
}

class VolumeInfoDto extends Equatable {
  const VolumeInfoDto({
    this.title,
    this.authors,
    this.publishedDate,
    this.pageCount,
    this.language,
    this.previewLink,
    this.description,
    this.categories,
    this.imageLinks,
  });

  final String? title;
  final List<String>? authors;
  final String? publishedDate;
  final int? pageCount;
  final String? language;
  final String? previewLink;
  final String? description;
  final List<String>? categories;
  final ImageLinkDto? imageLinks;

  factory VolumeInfoDto.fromJson(Map<String, dynamic> json) {
    return VolumeInfoDto(
      title: json['title'],
      authors: json['authors'] != null
          ? List<String>.from((json['authors'] as List<dynamic>))
          : null,
      publishedDate: json['publishedDate'],
      pageCount: json['pageCount'],
      language: json['language'],
      previewLink: json['previewLink'],
      description: json['description'],
      categories: json['categories'] != null
          ? List<String>.from((json['categories'] as List<dynamic>))
          : null,
      imageLinks: json['imageLinks'] != null
          ? ImageLinkDto.fromJson(json['imageLinks'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [
        title,
        authors,
        publishedDate,
        pageCount,
        language,
        previewLink,
        description,
        categories,
        imageLinks,
      ];
}

class ImageLinkDto extends Equatable {
  const ImageLinkDto({
    this.smallThumbnail,
    this.thumbnail,
  });

  final String? smallThumbnail;
  final String? thumbnail;

  factory ImageLinkDto.fromJson(Map<String, dynamic> json) {
    return ImageLinkDto(
      smallThumbnail: json['smallThumbnail'],
      thumbnail: json['thumbnail'],
    );
  }

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}
