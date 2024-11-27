class MovieEntity {
  final int? id;
  final String? title;
  final String? posterPath;
  final String? overview;
  final DateTime? releaseDate;
  final double? voteAverage;

  MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  bool operator ==(covariant MovieEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.posterPath == posterPath &&
        other.overview == overview &&
        other.releaseDate == releaseDate &&
        other.voteAverage == voteAverage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        posterPath.hashCode ^
        overview.hashCode ^
        releaseDate.hashCode ^
        voteAverage.hashCode;
  }

  @override
  String toString() {
    return '''
    MovieEntity(
    id: $id,
    title: $title, 
    posterPath: $posterPath,
    overview: $overview, 
    releaseDate: $releaseDate, 
    voteAverage: $voteAverage)
    ''';
  }
}
