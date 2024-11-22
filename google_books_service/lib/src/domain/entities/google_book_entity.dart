import 'package:equatable/equatable.dart';

import '../../../google_books_service.dart';

class GoogleBookEntity extends Equatable {
  const GoogleBookEntity({
    this.id,
    this.volumeInfo,
  });

  final String? id;
  final VolumeInfoEntity? volumeInfo;

  @override
  List<Object?> get props => [id, volumeInfo];

  @override
  bool? get stringify => true;
}
