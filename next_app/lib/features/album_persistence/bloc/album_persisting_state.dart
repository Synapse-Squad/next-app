part of 'album_persisting_bloc.dart';

class AlbumPersistingState {
  const AlbumPersistingState([this.recentlyAddedIds = const {}]);

  final Set<int> recentlyAddedIds;

  @override
  int get hashCode => Object.hashAll([recentlyAddedIds]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumPersistingState &&
          recentlyAddedIds == other.recentlyAddedIds;
}
