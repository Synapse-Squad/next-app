part of 'create_collection_bloc.dart';

enum CreateStatus { initial, success }

class CreateCollectionState extends Equatable {
  const CreateCollectionState({this.status = CreateStatus.initial});

  final CreateStatus status;

  CreateCollectionState copyWith({
    final CreateStatus? status,
  }) {
    return CreateCollectionState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
