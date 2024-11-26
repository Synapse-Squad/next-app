import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_collection_state.dart';

class CreateCollectionBloc extends Cubit<CreateCollectionState> {
  CreateCollectionBloc({
    required this.createCollectionUseCase,
    required this.validator,
  }) : super(const CreateCollectionState());

  final CreateCollectionUseCase createCollectionUseCase;
  final ValidateCreateCollectionUseCase validator;

  var _createParams = CreateCollectionParams();

  void submit() async {
    try {
      if (!_validate()) {
        return;
      }

      await createCollectionUseCase.execute(_createParams);
      emit(state.copyWith(status: CreateStatus.success));
    } catch (_) {}
  }

  void onTitleChanged(String? value) {
    _createParams = CreateCollectionParams(
      title: value,
      type: _createParams.type,
    );
    _validate();
  }

  void onTypeChanged(CollectionTypes? value) {
    _createParams = CreateCollectionParams(
      title: _createParams.title,
      type: value,
    );
    _validate();
  }

  bool _validate() {
    final validateResult = validator.execute(_createParams);
    emit(state.copyWith(validation: validateResult));
    return validateResult == null;
  }
}
