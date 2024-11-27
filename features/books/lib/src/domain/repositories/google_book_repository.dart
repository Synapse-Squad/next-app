import '../../../google_books_service.dart';

abstract interface class IGoogleBookRepository {
  Future<List<GoogleBookEntity>> search(String? query);
}
