import '../../../itunes_service.dart';
import '../data_source/album_data_source.dart';
import '../mappers/album_mapper.dart';

final class AlbumRepositoryImpl implements IAlbumRepository {
  const AlbumRepositoryImpl({required this.albumDataSource});

  final AlbumDataSource albumDataSource;

  @override
  Future<List<AlbumEntity>> search(String query) async {
    final dto = await albumDataSource.searchForAlbum(query);
    return AlbumMapper.toEntity(dto);
  }
}
