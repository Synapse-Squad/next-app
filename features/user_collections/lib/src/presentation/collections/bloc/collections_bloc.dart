import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_database_service/next_database_service.dart';

import '../../../core/exceptions/user_collection_exceptions.dart';
import '../../../domain/entities/collection_entity.dart';
import '../../../domain/params/get_collections_params.dart';
import '../../../domain/use_cases/get_collections_use_case.dart';

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
        GetCollectionsParams(
          type: event.type,
          orderOptions: event.orderOptions,
        ),
      );

      emit(CollectionsLoadSuccess(collections));
    } on CollectionsNotFoundException {
      emit(const CollectionsEmpty());
    } catch (_) {
      emit(const CollectionsLoadFailure());
    }
  }
}
