import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_collections/user_collections.dart';

import '../../../core/bloc/data_state.dart';

export '../../../core/bloc/data_state.dart';

part 'collections_event.dart';

typedef CollectionsState = DataState<List<CollectionEntity>>;

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  CollectionsBloc(this.getCollectionsUseCase) : super(DataState.initial()) {
    on<CollectionsRequired>(_onCollectionsRequired);
  }

  final GetCollectionsUseCase getCollectionsUseCase;

  void _onCollectionsRequired(
    CollectionsRequired event,
    Emitter<CollectionsState> emit,
  ) async {
    emit(DataState.inProgress());

    final collections = await getCollectionsUseCase(
      GetCollectionsParams(
        type: event.type,
        orderOptions: event.orderOptions,
      ),
    );

    collections.fold(
      onLeft: (failure) {
        emit(DataState.failure(failure));
      },
      onRight: (collections) {
        if (collections.isEmpty) {
          emit(DataState.empty());
          return;
        }

        emit(DataState.success(collections));
      },
    );
  }
}
