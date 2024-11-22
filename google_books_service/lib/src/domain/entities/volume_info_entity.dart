import 'package:collection/collection.dart';

import '../../../google_books_service.dart';

class VolumeInfoEntity {
  final String? title;
  final List<String>? authors;
  final DateTime? publishedDate;
  final int? pageCount;
  final ImageLinkEntity? imageLinks;
  final String? language;
  final String? previewLink;
  final String? description;
  final List<String>? categories;
  final int? ratingsCount;

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
    this.ratingsCount,
  });

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
        listEquals(other.categories, categories) &&
        other.ratingsCount == ratingsCount;
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
        categories.hashCode ^
        ratingsCount.hashCode;
  }
}
