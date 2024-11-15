class GenreDto {
  const GenreDto({
    required this.id,
    required this.name,
  });

  factory GenreDto.fromJson(Map<String, dynamic> json) {
    return GenreDto(
      id: json['id'],
      name: json['name'],
    );
  }

  final int id;
  final String name;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
