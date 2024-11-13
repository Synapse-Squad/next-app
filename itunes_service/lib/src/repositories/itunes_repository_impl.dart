import 'package:itunes_service/src/mappers/album_mapper.dart';

import '../data_source/album_data_source.dart';
import '../entities/album_entity.dart';
import 'itunes_repository.dart';

final class ItunesRepositoryImpl implements ItunesRepository {
  const ItunesRepositoryImpl({required this.albumDataSource});

  final AlbumDataSource albumDataSource;

  @override
  Future<List<AlbumEntity>> searchForAlbum(String query) async {
    final dto = await albumDataSource.searchForAlbum(query);
    return AlbumMapper.toEntity(dto);
  }
}
