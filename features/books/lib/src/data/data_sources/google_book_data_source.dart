import '../dtos/google_book_dto.dart';

abstract interface class GoogleBookDataSource {
  Future<List<GoogleBookDto>> searchForBook({String? query});
}
