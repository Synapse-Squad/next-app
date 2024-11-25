library testing_utils;

import 'dart:convert';
import 'dart:io';

class TestFileReader {
  TestFileReader._();

  static Future<dynamic> read(String path) async {
    var dir = Directory.current.path;

    final file = await File('$dir/$path').readAsString();
    return jsonDecode(file);
  }
}
