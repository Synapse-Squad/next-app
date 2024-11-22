library testing_utils;

import 'dart:convert';
import 'dart:io';

enum MockJsonPath {
  album('test/mock/jsons/album.json'),
  book('test/mock/jsons/book.json');

  const MockJsonPath(this.uri);

  final String uri;
}

class TestFileReader {
  TestFileReader._();

  static Future<dynamic> read(MockJsonPath path) async {
    var dir = Directory.current.path;

    final file = await File('$dir/${path.uri}').readAsString();
    return jsonDecode(file);
  }
}
