import '../../../google_books_service.dart';
import '../mappers/google_book_mapper.dart';

class GoogleBookRepositoryImpl implements IGoogleBookRepository {
  GoogleBookRepositoryImpl({required this.bookDataSource});

  final GoogleBookDataSource bookDataSource;

  @override
  Future<List<GoogleBookEntity>> search(String? query) async {
    final bookDtoList = await bookDataSource.searchForBook(query: query);
    return GoogleBookMapper.toEntity(bookDtoList);
  }
}
