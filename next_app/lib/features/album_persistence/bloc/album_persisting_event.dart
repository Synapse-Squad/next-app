part of 'album_persisting_bloc.dart';

abstract class AlbumPersistingEvent {
  const AlbumPersistingEvent();
}

class AlbumSavingRequired extends AlbumPersistingEvent {
  const AlbumSavingRequired(this.album);

  final AlbumEntity album;

  @override
  int get hashCode => Object.hashAll([album]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumSavingRequired && album == other.album;
}

class AlbumUnsavingRequired extends AlbumPersistingEvent {
  const AlbumUnsavingRequired(this.album);

  final AlbumEntity album;

  @override
  int get hashCode => Object.hashAll([album]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumSavingRequired && album == other.album;
}
