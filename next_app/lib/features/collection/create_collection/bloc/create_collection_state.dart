part of 'create_collection_bloc.dart';

enum CreateStatus { initial, success }

class CreateCollectionState extends Equatable {
  const CreateCollectionState({
    this.status = CreateStatus.initial,
    this.validation,
  });

  final CreateStatus status;
  final CreateCollectionValidatorResult? validation;

  CreateCollectionState copyWith({
    final CreateStatus? status,
    final CreateCollectionValidatorResult? validation,
  }) {
    return CreateCollectionState(
      status: status ?? this.status,
      validation: validation,
    );
  }

  @override
  List<Object?> get props => [validation, status];
}
