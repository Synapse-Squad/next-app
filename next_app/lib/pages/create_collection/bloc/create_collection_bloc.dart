import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_collections/user_collections.dart';

part 'create_collection_state.dart';

class CreateCollectionBloc extends Cubit<CreateCollectionState> {
  CreateCollectionBloc({
    required this.createCollectionUseCase,
  }) : super(const CreateCollectionState());

  final CreateCollectionUseCase createCollectionUseCase;

  ({String? title, CollectionTypes? type})? _createParams;

  void submit() async {
    await createCollectionUseCase(
      CollectionParams(
        title: _createParams!.title!,
        type: _createParams!.type!,
      ),
    );
    emit(state.copyWith(status: CreateStatus.success));
  }

  void onTitleChanged(String? value) {
    _createParams = (title: value, type: _createParams?.type);
  }

  void onTypeChanged(CollectionTypes? value) {
    _createParams = (title: _createParams?.title, type: value);
  }
}
