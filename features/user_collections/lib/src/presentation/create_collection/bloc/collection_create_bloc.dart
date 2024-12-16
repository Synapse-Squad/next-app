import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_database_service/next_database_service.dart';

import '../../../core/exceptions/user_collection_exceptions.dart';
import '../../../domain/params/create_collection_params.dart';
import '../../../domain/use_cases/create_collection_use_case.dart';

part 'collection_create_state.dart';

class CreateCollectionBloc extends Cubit<CollectionCreateState> {
  CreateCollectionBloc({
    required this.createCollectionUseCase,
  }) : super(const CollectionCreateInitial());

  final CreateCollectionUseCase createCollectionUseCase;

  ({String? title, CollectionTypes? type})? _createParams;

  void submit() async {
    try {
      if (_createParams == null ||
          _createParams!.type == null ||
          _createParams!.title == null) {
        return;
      }

      await createCollectionUseCase(
        CollectionParams(
          title: _createParams!.title!,
          type: _createParams!.type!,
        ),
      );

      emit(const CollectionCreateSucceed());
    } on InvalidDataException {
      emit(const InvalidTitleDetected());
    } on SameCollectionFoundException {
      emit(SameCollectionFound());
    } catch (_) {
      emit(const CollectionCreateFailed());
    }
  }

  void onTitleChanged(String? value) {
    _createParams = (title: value, type: _createParams?.type);
  }

  void onTypeChanged(CollectionTypes? value) {
    _createParams = (title: _createParams?.title, type: value);
  }
}
