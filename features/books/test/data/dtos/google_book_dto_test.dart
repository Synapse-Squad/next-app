import 'package:books/src/data/dtos/google_book_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_utils/testing_utils.dart';

import '../../mock/data/mock_book.dart';

void main() {
  test('GoogleBookDto should parse the json successfully', () async {
    final bookJson = await TestFileReader.read('test/mock/jsons/book.json');
    final parsedBook = GoogleBookDto.fromJson(bookJson);
    expect(parsedBook, mockBook);
  });
}
