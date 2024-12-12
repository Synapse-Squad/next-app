import 'package:equatable/equatable.dart';

class ImageLinkEntity extends Equatable {
  const ImageLinkEntity({
    this.smallThumbnail,
  });

  final String? smallThumbnail;

  @override
  List<Object?> get props => [smallThumbnail];

  @override
  bool? get stringify => true;
}
