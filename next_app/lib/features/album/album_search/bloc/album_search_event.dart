part of 'album_search_bloc.dart';

abstract class AlbumSearchEvent {
  const AlbumSearchEvent();
}

class AlbumQueried extends AlbumSearchEvent {
  const AlbumQueried(this.query);

  final String query;

  @override
  int get hashCode => Object.hashAll([query]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AlbumQueried && query == other.query;
}
