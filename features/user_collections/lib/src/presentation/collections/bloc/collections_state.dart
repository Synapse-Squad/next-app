part of 'collections_bloc.dart';

sealed class CollectionsState extends Equatable {
  const CollectionsState();

  @override
  List<Object?> get props => [];
}

class CollectionsLoadInitial extends CollectionsState {
  const CollectionsLoadInitial();
}

class CollectionsLoadInProgress extends CollectionsState {
  const CollectionsLoadInProgress();
}

class CollectionsEmpty extends CollectionsState {
  const CollectionsEmpty();
}

class CollectionsLoadFailure extends CollectionsState {
  const CollectionsLoadFailure();
}

class CollectionsLoadSuccess extends CollectionsState {
  const CollectionsLoadSuccess(this.collections);

  final List<CollectionEntity> collections;

  @override
  List<Object?> get props => [collections];
}
