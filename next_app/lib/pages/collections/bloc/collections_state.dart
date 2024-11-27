part of 'collections_bloc.dart';

sealed class CollectionsState extends Equatable {
  const CollectionsState(this.type);

  final CollectionTypes type;

  @override
  List<Object?> get props => [type];
}

class CollectionsInitial extends CollectionsState {
  const CollectionsInitial() : super(CollectionTypes.all);
}

class CollectionsEmpty extends CollectionsState {
  const CollectionsEmpty(super.type);
}

class CollectionsSuccess extends CollectionsState {
  const CollectionsSuccess({
    required CollectionTypes type,
    required this.collections,
  }) : super(type);

  final List<CollectionEntity> collections;

  @override
  List<Object?> get props => [type, collections];
}
