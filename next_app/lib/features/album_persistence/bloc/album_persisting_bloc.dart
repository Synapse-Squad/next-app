import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_service/itunes_service.dart';

part 'album_persisting_event.dart';
part 'album_persisting_state.dart';

class AlbumPersistingBloc
    extends Bloc<AlbumPersistingEvent, AlbumPersistingState> {
  AlbumPersistingBloc() : super(AlbumPersistingInitial());
}
