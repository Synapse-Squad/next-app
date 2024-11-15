import 'dart:convert';

import 'package:drift/drift.dart';

class ListConverter extends TypeConverter<List<String>, String> {
  const ListConverter();

  @override
  List<String> fromSql(String fromDb) {
    final convertedGenres = jsonDecode(fromDb) as List<dynamic>;
    return convertedGenres.map((genre) => genre.toString()).toList();
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}
