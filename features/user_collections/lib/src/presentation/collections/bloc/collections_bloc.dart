import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_database_service/next_database_service.dart';

import '../../../application/entities/collection_entity.dart';
import '../../../application/use_cases/get_collections_use_case.dart';
import '../../../core/exceptions/user_collection_exceptions.dart';

part 'collections_event.dart';
part 'collections_state.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  CollectionsBloc(this.getCollectionsUseCase)
      : super(const CollectionsLoadInitial()) {
    on<CollectionsRequired>(_onCollectionsRequired);
  }

  final GetCollectionsUseCase getCollectionsUseCase;

  void _onCollectionsRequired(
    CollectionsRequired event,
    Emitter<CollectionsState> emit,
  ) async {
    try {
      emit(const CollectionsLoadInProgress());

      final collections = await getCollectionsUseCase(
        type: event.type,
        orderOptions: event.orderOptions,
      );

      emit(CollectionsLoadSuccess(collections));
    } on CollectionsNotFoundException {
      emit(const CollectionsEmpty());
    } catch (_) {
      emit(const CollectionsLoadFailure());
    }
  }
}
