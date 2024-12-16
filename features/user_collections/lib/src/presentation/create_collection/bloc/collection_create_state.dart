part of 'collection_create_bloc.dart';

abstract class CollectionCreateState {
  const CollectionCreateState();
}

class CollectionCreateInitial extends CollectionCreateState {
  const CollectionCreateInitial();
}

class SameCollectionFound extends CollectionCreateState {
  SameCollectionFound();
}

class InvalidTitleDetected extends CollectionCreateState {
  const InvalidTitleDetected();
}

class CollectionCreateFailed extends CollectionCreateState {
  const CollectionCreateFailed();
}

class CollectionCreateSucceed extends CollectionCreateState {
  const CollectionCreateSucceed();
}
