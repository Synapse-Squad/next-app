// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_books_service/src/domain/entities/volume_info_entity.dart';

class GoogleBookEntity {
  final String? id;
  final VolumeInfoEntity? volumeInfo;

  GoogleBookEntity({
    this.id,
    this.volumeInfo,
  });

  @override
  bool operator ==(covariant GoogleBookEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.volumeInfo == volumeInfo;
  }

  @override
  int get hashCode => id.hashCode ^ volumeInfo.hashCode;
}
