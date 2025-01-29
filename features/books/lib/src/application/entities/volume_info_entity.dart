import 'package:equatable/equatable.dart';

import '../../../google_books_service.dart';

class VolumeInfoEntity extends Equatable {
  const VolumeInfoEntity({
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
  List<Object?> get props => [
        title,
        authors,
        publishedDate,
        pageCount,
        imageLinks,
        language,
        previewLink,
        description,
        categories,
      ];

  @override
  bool? get stringify => true;
}
