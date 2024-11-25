import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'collections_event.dart';
part 'collections_state.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  CollectionsBloc(this.getCollectionsUseCase)
      : super(const CollectionsInitial()) {
    on<CollectionsRequired>(_onCollectionsRequired);
  }

  final GetCollectionsUseCase getCollectionsUseCase;

  void _onCollectionsRequired(
    CollectionsRequired event,
    Emitter<CollectionsState> emit,
  ) async {
    try {
      final collections = await getCollectionsUseCase.execute(
        GetCollectionsParams(
          type: event.type,
          orderOptions: event.orderOptions,
        ),
      );

      if (collections.isEmpty) {
        emit(CollectionsEmpty(event.type));
        return;
      }

      emit(
        CollectionsSuccess(
          collections: collections,
          type: event.type,
        ),
      );
    } catch (_) {}
  }
}
