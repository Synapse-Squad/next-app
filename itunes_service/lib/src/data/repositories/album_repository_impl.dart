import 'package:domain/domain.dart';

import '../../../itunes_service.dart';
import '../mappers/album_mapper.dart';

final class AlbumRepositoryImpl implements RemoteAlbumRepository {
  const AlbumRepositoryImpl({required this.albumDataSource});

  final AlbumDataSource albumDataSource;

  @override
  Future<List<AlbumEntity>> search(String query) async {
    final dto = await albumDataSource.searchForAlbum(query);
    return AlbumMapper.toEntity(dto);
  }
}
