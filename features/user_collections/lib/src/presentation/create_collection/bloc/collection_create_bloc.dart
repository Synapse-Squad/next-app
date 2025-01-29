import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_database_service/next_database_service.dart';

import '../../../application/use_cases/create_collection_use_case.dart';
import '../../../core/exceptions/user_collection_exceptions.dart';

part 'collection_create_state.dart';

class CreateCollectionBloc extends Cubit<CollectionCreateState> {
  CreateCollectionBloc({
    required this.createCollectionUseCase,
  }) : super(const CollectionCreateInitial());

  final CreateCollectionUseCase createCollectionUseCase;

  String? _title;
  CollectionTypes? _type;

  void submit() async {
    try {
      if (_title == null || _type == null) {
        return;
      }

      await createCollectionUseCase(
        title: _title!,
        type: _type!,
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

  void onTitleChanged(String? value) => _title = value;

  void onTypeChanged(CollectionTypes? value) => _type = value;
}
