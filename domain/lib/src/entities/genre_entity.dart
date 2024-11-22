class GenreEntity {
  GenreEntity({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  @override
  String toString() {
    return '''GenreEntity(
    id: $id, 
    name: $name, 
   )
   ''';
  }

  @override
  bool operator ==(covariant GenreEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
