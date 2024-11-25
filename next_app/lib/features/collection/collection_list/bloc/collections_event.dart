part of 'collections_bloc.dart';

abstract class CollectionsEvent extends Equatable {
  const CollectionsEvent();

  @override
  List<Object?> get props => [];
}

class CollectionsRequired extends CollectionsEvent {
  const CollectionsRequired({
    required this.type,
    this.orderOptions,
  });

  final CollectionTypes type;
  final OrderOptions? orderOptions;

  @override
  List<Object?> get props => [type, orderOptions];
}
