import 'package:facades/facades.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_service/itunes_service.dart';

part 'album_persisting_event.dart';
part 'album_persisting_state.dart';

class AlbumPersistingBloc
    extends Bloc<AlbumPersistingEvent, AlbumPersistingState> {
  AlbumPersistingBloc(this.albumFacade) : super(const AlbumPersistingState()) {
    on<AlbumSavingRequired>(_onAlbumSavingRequired);
    on<AlbumRemovingRequired>(_onAlbumRemovingRequired);
  }

  final IAlbumFacade albumFacade;

  /// remoteId:localId Map
  final _previouslyPersistedRemoteIds = <int, int>{};

  void _onAlbumSavingRequired(
    AlbumSavingRequired event,
    Emitter<AlbumPersistingState> emit,
  ) async {
    try {
      final album = event.album;

      final result = await albumFacade.persistSelectedItem(
        collectionId: 2,
        entity: album,
      );

      _previouslyPersistedRemoteIds[album.id!] = result;
      emit(AlbumPersistingState({..._mapRemoteIds()}));
    } catch (e, s) {
      debugPrintThrottled('$e => $s');
      //  emit(const AlbumPersistingFailure());
    }
  }

  void _onAlbumRemovingRequired(
    AlbumRemovingRequired event,
    Emitter<AlbumPersistingState> emit,
  ) async {
    try {
      final album = event.album;
      final localId = _previouslyPersistedRemoteIds[album.id!];

      if (localId == null) return;

      await albumFacade.delete(localId);
      _previouslyPersistedRemoteIds.remove(album.id);

      emit(AlbumPersistingState({..._mapRemoteIds()}));
    } catch (_) {
      //  emit(const AlbumPersistingFailure());
    }
  }

  Set<int> _mapRemoteIds() => _previouslyPersistedRemoteIds.keys.toSet();
}
