import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_service/itunes_service.dart';

import '../../../../core/bloc/selector.dart';
import '../../album_persistence/album_persistence_api.dart';

part 'album_search_event.dart';
part 'album_search_state.dart';

class AlbumSearchBloc extends Bloc<AlbumSearchEvent, AlbumSearchState> {
  AlbumSearchBloc({
    required this.searchAlbumUseCase,
    required this.albumPersistenceApi,
  }) : super(AlbumSearchInitial()) {
    on<AlbumQueried>(
      _onAlbumQueried,
      transformer: restartable(),
    );

    _recentlyAddedIds = albumPersistenceApi.idsStream.listen(
      (ids) {
        if (state is! AlbumSearchSuccess) {
          return;
        }

        final currentState = state as AlbumSearchSuccess;
        final currentSearchItems = currentState.albums;
        _recentIds.clear();
        _recentIds.addAll([...ids]);

        final filteredAlbums = _filterForChanges(
          currentSearchItems: currentSearchItems,
        );

        emit(AlbumSearchSuccess([...filteredAlbums]));
      },
    );
  }

  final SearchAlbumUseCase searchAlbumUseCase;
  final AlbumPersistenceApi albumPersistenceApi;

  StreamSubscription<Set<int>>? _recentlyAddedIds;
  final _recentIds = <int>{};

  void _onAlbumQueried(
    AlbumQueried event,
    Emitter<AlbumSearchState> emit,
  ) async {
    try {
      emit(AlbumInProgress());
      final albums = await searchAlbumUseCase.execute(
        SearchQueryParams(event.query),
      );

      emit(AlbumSearchSuccess(_mapToSelector(albums)));
    } on AlbumNotFoundException {
      emit(AlbumNotFound());
    } catch (_) {
      emit(AlbumSearchFailure());
    }
  }

  List<Selector<AlbumEntity>> _mapToSelector(List<AlbumEntity> albums) => albums
      .map(
        (album) => Selector(
          data: album,
          selected: _recentIds.contains(album.id),
        ),
      )
      .toList();

  List<Selector<AlbumEntity>> _filterForChanges({
    required List<Selector<AlbumEntity>> currentSearchItems,
  }) {
    final selectorMapping = <Selector<AlbumEntity>>[];

    for (int i = 0; i < currentSearchItems.length; i++) {
      final album = currentSearchItems[i];

      selectorMapping.add(
        Selector(
          data: album.data,
          selected: _recentIds.contains(album.data.id),
        ),
      );
    }

    return selectorMapping;
  }

  @override
  Future<void> close() {
    _recentlyAddedIds?.cancel();
    _recentlyAddedIds = null;
    _recentIds.clear();
    return super.close();
  }
}
