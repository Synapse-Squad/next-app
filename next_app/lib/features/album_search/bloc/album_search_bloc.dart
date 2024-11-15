import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_service/itunes_service.dart';

part 'album_search_event.dart';
part 'album_search_state.dart';

class AlbumSearchBloc extends Bloc<AlbumSearchEvent, AlbumSearchState> {
  AlbumSearchBloc(this.albumRepository) : super(AlbumSearchInitial()) {
    on<AlbumQueried>(
      _onAlbumQueried,
      transformer: restartable(),
    );
  }

  final IAlbumRepository albumRepository;

  void _onAlbumQueried(
    AlbumQueried event,
    Emitter<AlbumSearchState> emit,
  ) async {
    try {
      emit(AlbumInProgress());
      final albums = await albumRepository.search(event.query);
      emit(AlbumSearchSuccess(albums));
    } on AlbumNotFoundException {
      emit(AlbumNotFound());
    } catch (_) {
      emit(AlbumSearchFailure());
    }
  }
}
