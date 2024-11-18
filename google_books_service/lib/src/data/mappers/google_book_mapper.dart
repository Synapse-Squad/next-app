import 'package:google_books_service/src/data/dtos/google_book_dto.dart';
import 'package:google_books_service/src/domain/entities/google_book_entity.dart';
import 'package:google_books_service/src/domain/entities/image_link_entity.dart';
import 'package:google_books_service/src/domain/entities/volume_info_entity.dart';

class GoogleBookMapper {
  static List<GoogleBookEntity> toEntity(List<GoogleBookDto> bookDtoList) {
    return bookDtoList.map(
      (bookDto) {
        return GoogleBookEntity(
          id: bookDto.id,
          volumeInfo: VolumeInfoEntity(
            authors: bookDto.volumeInfo?.authors,
            categories: bookDto.volumeInfo?.categories,
            description: bookDto.volumeInfo?.description,
            imageLinks: ImageLinkEntity(
                smallThumbnail: bookDto.volumeInfo?.imageLinks?.smallThumbnail),
            language: bookDto.volumeInfo?.language,
            pageCount: bookDto.volumeInfo?.pageCount,
            previewLink: bookDto.volumeInfo?.previewLink,
            publishedDate: bookDto.volumeInfo?.publishedDate,
            ratingsCount: bookDto.volumeInfo?.ratingsCount,
            title: bookDto.volumeInfo?.title,
          ),
        );
      },
    ).toList();
  }
}
