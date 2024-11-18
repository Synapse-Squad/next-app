import 'package:google_books_service/src/core/exceptions/book_not_found_exception.dart';
import 'package:google_books_service/src/data/data_source/google_book_data_source.dart';
import 'package:google_books_service/src/data/dtos/google_book_dto.dart';
import 'package:rest_service/rest_service.dart';

class GoogleBookDataSourceImpl implements GoogleBookDataSource {
  final HttpRestClient client;
  GoogleBookDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<GoogleBookDto>> searchForBook({String? query}) async {
    final response = await client.get(
      '/volumes',
      queryParameters: {
        'q': query,
        'limit': 10,
      },
    );

    final books = response?['items'] as List<dynamic>?;

    if (response == null || books == null || books.isEmpty) {
      throw BookNotFoundException();
    }

    return books
        .map(
          (book) => GoogleBookDto.fromMap(book),
        )
        .toList();
  }
}
