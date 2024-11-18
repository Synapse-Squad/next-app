import 'package:google_books_service/src/data/dtos/google_book_dto.dart';

abstract interface class GoogleBookDataSource {
  Future<List<GoogleBookDto>> searchForBook({String? query});
}
