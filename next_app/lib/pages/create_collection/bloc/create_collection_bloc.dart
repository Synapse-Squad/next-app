import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_collections/user_collections.dart';

part 'create_collection_state.dart';

class CreateCollectionBloc extends Cubit<CreateCollectionState> {
  CreateCollectionBloc({
    required this.createCollectionUseCase,
  }) : super(const CreateCollectionState());

  final CreateCollectionUseCase createCollectionUseCase;

  var _createParams = CreateCollectionParams();

  void submit() async {
    try {
      await createCollectionUseCase(_createParams);
      emit(state.copyWith(status: CreateStatus.success));
    } catch (_) {}
  }

  void onTitleChanged(String? value) {
    _createParams = CreateCollectionParams(
      title: value,
      type: _createParams.type,
    );
  }

  void onTypeChanged(CollectionTypes? value) {
    _createParams = CreateCollectionParams(
      title: _createParams.title,
      type: value,
    );
  }
}
