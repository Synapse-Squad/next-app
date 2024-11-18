import 'package:google_books_service/src/data/data_source/google_book_data_source.dart';
import 'package:google_books_service/src/data/mappers/google_book_mapper.dart';
import 'package:google_books_service/src/domain/entities/google_book_entity.dart';
import 'package:google_books_service/src/domain/repositories/google_book_repository.dart';

class GoogleBookRepositoryImpl implements IGoogleBookRepository {
  final GoogleBookDataSource bookDataSource;

  GoogleBookRepositoryImpl({required this.bookDataSource});

  @override
  Future<List<GoogleBookEntity>> search(String? query) async {
    final bookDtoList = await bookDataSource.searchForBook(query: query);

    return GoogleBookMapper.toEntity(bookDtoList);
  }
}
