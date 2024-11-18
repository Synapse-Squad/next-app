import 'package:google_books_service/src/domain/entities/google_book_entity.dart';

abstract interface class IGoogleBookRepository {
  Future<List<GoogleBookEntity>> search(String? query);
}
