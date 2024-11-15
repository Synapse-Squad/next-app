enum CollectionTypes {
  movie(1),
  book(2),
  album(3),
  podcast(4);

  const CollectionTypes(this.typeId);

  final int typeId;
}
