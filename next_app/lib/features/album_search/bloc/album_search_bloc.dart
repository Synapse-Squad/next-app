import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:facades/facades.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_service/itunes_service.dart';
import 'package:next_app/features/album_persistence/album_persistence_api.dart';

import '../../../core/bloc/selector.dart';

part 'album_search_event.dart';
part 'album_search_state.dart';

class AlbumSearchBloc extends Bloc<AlbumSearchEvent, AlbumSearchState> {
  AlbumSearchBloc({
    required this.albumFacade,
    required this.albumPersistenceApi,
  }) : super(AlbumSearchInitial()) {
    on<AlbumQueried>(
      _onAlbumQueried,
      transformer: restartable(),
    );
  }

  final IAlbumFacade albumFacade;
  final AlbumPersistenceApi albumPersistenceApi;

  void _onAlbumQueried(
    AlbumQueried event,
    Emitter<AlbumSearchState> emit,
  ) async {
    try {
      emit(AlbumInProgress());
      final albums = await albumFacade.searchForRemoteList(event.query);
      emit(AlbumSearchSuccess(_mapToSelector(albums)));
    } on AlbumNotFoundException {
      emit(AlbumNotFound());
    } catch (_) {
      emit(AlbumSearchFailure());
    }
  }

  List<Selector<AlbumEntity>> _mapToSelector(List<AlbumEntity> albums) =>
      albums.map((album) => Selector(data: album)).toList();
}
