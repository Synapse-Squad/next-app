part of 'album_search_bloc.dart';

abstract class AlbumSearchState {
  const AlbumSearchState();
}

class AlbumSearchInitial extends AlbumSearchState {}

class AlbumSearchSuccess extends AlbumSearchState {
  const AlbumSearchSuccess(this.albums);

  final List<Selector<AlbumEntity>> albums;

  @override
  int get hashCode => Object.hashAll([albums]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumSearchSuccess && albums == other.albums;
}

class AlbumNotFound extends AlbumSearchState {}

class AlbumSearchFailure extends AlbumSearchState {}

class AlbumInProgress extends AlbumSearchState {}
