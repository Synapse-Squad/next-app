import 'package:flutter_test/flutter_test.dart';
import 'package:google_books_service/src/data/dtos/google_book_dto.dart';
import 'package:testing_utils/testing_utils.dart';

import '../../mock/data/mock_book.dart';

void main() {
  test('GoogleBookDto should parse the json successfully', () async {
    final bookJson = await TestFileReader.read(MockJsonPath.book);
    final parsedBook = GoogleBookDto.fromJson(bookJson);
    expect(parsedBook, mockBook);
  });
}
