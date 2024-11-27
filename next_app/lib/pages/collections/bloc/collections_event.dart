part of 'collections_bloc.dart';

abstract class CollectionsEvent extends Equatable {
  const CollectionsEvent();

  @override
  List<Object?> get props => [];
}

class CollectionsRequired extends CollectionsEvent {
  const CollectionsRequired({
    this.type = CollectionTypes.all,
    this.orderOptions,
  });

  final CollectionTypes type;
  final OrderOptions? orderOptions;

  @override
  List<Object?> get props => [type, orderOptions];
}
