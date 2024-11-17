part of 'album_persisting_bloc.dart';

abstract class AlbumPersistingState {
  const AlbumPersistingState();
}

class AlbumPersistingInitial extends AlbumPersistingState {}

class AlbumPersistingSuccess extends AlbumPersistingState {
  const AlbumPersistingSuccess(this.recentlyAddedIds);

  final Set<int> recentlyAddedIds;
}
