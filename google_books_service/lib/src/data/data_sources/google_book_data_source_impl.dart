import 'package:rest_service/rest_service.dart';

import '../../../google_books_service.dart';
import '../dtos/google_book_dto.dart';

class GoogleBookDataSourceImpl implements GoogleBookDataSource {
  GoogleBookDataSourceImpl({required this.client});

  final HttpRestClient client;

  @override
  Future<List<GoogleBookDto>> searchForBook({String? query}) async {
    final response = await client.get(
      '/volumes',
      queryParameters: {
        if (query != null) 'q': query,
        'limit': '10',
      },
    );

    final books = response?['items'] as List<dynamic>?;

    if (response == null || books == null || books.isEmpty) {
      throw BookNotFoundException();
    }

    return books
        .map(
          (book) => GoogleBookDto.fromJson(book),
        )
        .toList();
  }
}
