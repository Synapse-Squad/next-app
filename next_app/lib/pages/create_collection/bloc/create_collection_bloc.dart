import 'package:either/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_app/core/bloc/data_state.dart';
import 'package:user_collections/user_collections.dart';

export 'package:next_app/core/bloc/data_state.dart';

typedef CreateCollectionState = DataState<Unit>;
typedef CreateCollectionInitial = DataInitial<Unit>;
typedef CreateCollectionFailure = DataFailure<Unit>;

class CreateCollectionBloc extends Cubit<CreateCollectionState> {
  CreateCollectionBloc({
    required this.createCollectionUseCase,
  }) : super(const CreateCollectionInitial());

  final CreateCollectionUseCase createCollectionUseCase;

  ({String? title, CollectionTypes? type})? _createParams;

  void submit() async {
    if (_createParams == null ||
        _createParams!.type == null ||
        _createParams!.title == null) {
      return;
    }

    final result = await createCollectionUseCase(
      CollectionParams(
        title: _createParams!.title!,
        type: _createParams!.type!,
      ),
    );

    result.fold(
      onLeft: (failure) => emit(DataState.failure(failure)),
      onRight: (_) => emit(DataState.success(unit)),
    );
  }

  void onTitleChanged(String? value) {
    _createParams = (title: value, type: _createParams?.type);
  }

  void onTypeChanged(CollectionTypes? value) {
    _createParams = (title: _createParams?.title, type: value);
  }
}
