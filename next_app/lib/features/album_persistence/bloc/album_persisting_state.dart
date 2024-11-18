part of 'album_persisting_bloc.dart';

abstract class AlbumPersistingState {
  const AlbumPersistingState();
}

class AlbumPersistingInitial extends AlbumPersistingState {}

class AlbumPersistingSuccess extends AlbumPersistingState {
  const AlbumPersistingSuccess(this.recentlyAddedIds);

  final Set<int> recentlyAddedIds;

  @override
  int get hashCode => Object.hashAll([recentlyAddedIds]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumPersistingSuccess &&
          recentlyAddedIds == other.recentlyAddedIds;
}

class AlbumPersistingFailure extends AlbumPersistingState {
  const AlbumPersistingFailure();
}
