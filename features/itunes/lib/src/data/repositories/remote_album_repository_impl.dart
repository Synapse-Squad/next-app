import 'package:either/either.dart';

import '../../../itunes_service.dart';
import '../../core/exceptions/album_not_found_exception.dart';
import '../../core/failures/album_not_found_failure.dart';
import '../../domain/entities/album_entity.dart';
import '../../domain/repositories/album_repository.dart';
import '../mappers/album_mapper.dart';

final class RemoteAlbumRepositoryImpl implements RemoteAlbumRepository {
  const RemoteAlbumRepositoryImpl({required this.albumDataSource});

  final AlbumDataSource albumDataSource;

  @override
  Future<Either<Failure, List<AlbumEntity>>> search(String query) async {
    try {
      final dto = await albumDataSource.searchForAlbum(query);
      return Right(AlbumMapper.toEntity(dto));
    } on AlbumNotFoundException {
      return const Left(AlbumNotFoundFailure());
    } catch (e, s) {
      return Left(Failure.unknown(error: e, stackTrace: s));
    }
  }
}
