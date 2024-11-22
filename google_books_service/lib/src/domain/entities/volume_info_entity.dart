import 'package:collection/collection.dart';

import '../../../google_books_service.dart';

class VolumeInfoEntity {
  VolumeInfoEntity({
    this.title,
    this.authors,
    this.publishedDate,
    this.pageCount,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.description,
    this.categories,
  });

  final String? title;
  final List<String>? authors;
  final String? publishedDate;
  final int? pageCount;
  final ImageLinkEntity? imageLinks;
  final String? language;
  final String? previewLink;
  final String? description;
  final List<String>? categories;

  @override
  bool operator ==(covariant VolumeInfoEntity other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.title == title &&
        listEquals(other.authors, authors) &&
        other.publishedDate == publishedDate &&
        other.pageCount == pageCount &&
        other.imageLinks == imageLinks &&
        other.language == language &&
        other.previewLink == previewLink &&
        other.description == description &&
        listEquals(other.categories, categories);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        authors.hashCode ^
        publishedDate.hashCode ^
        pageCount.hashCode ^
        imageLinks.hashCode ^
        language.hashCode ^
        previewLink.hashCode ^
        description.hashCode ^
        categories.hashCode;
  }
}
