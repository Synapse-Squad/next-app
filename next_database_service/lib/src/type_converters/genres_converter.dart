import 'dart:convert';

import 'package:drift/drift.dart';

import '../../dtos/genre_dto.dart';

class GenresConverter extends TypeConverter<List<GenreDto>, String> {
  const GenresConverter();

  @override
  List<GenreDto> fromSql(String fromDb) {
    final convertedGenres = jsonDecode(fromDb) as List<dynamic>;
    return convertedGenres.map((genre) => GenreDto.fromJson(genre)).toList();
  }

  @override
  String toSql(List<GenreDto> value) {
    return jsonEncode(value);
  }
}
