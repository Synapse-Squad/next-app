class ImageLinkEntity {
  final String? smallThumbnail;
  ImageLinkEntity({
    this.smallThumbnail,
  });

  @override
  bool operator ==(covariant ImageLinkEntity other) {
    if (identical(this, other)) return true;

    return other.smallThumbnail == smallThumbnail;
  }

  @override
  int get hashCode => smallThumbnail.hashCode;
}
