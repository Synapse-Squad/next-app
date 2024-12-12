import 'package:either/either.dart';

import '../../core/exceptions/podcast_not_found_exception.dart';
import '../../core/failures/podcast_not_found_failure.dart';
import '../../domain/entities/podcast_entity.dart';
import '../../domain/repositories/podcast_repository.dart';
import '../data_sources/podcast_data_source.dart';
import '../mappers/podcast_mapper.dart';

final class RemotePodcastRepositoryImpl implements RemotePodcastRepository {
  const RemotePodcastRepositoryImpl(this.podcastDataSource);

  final PodcastDataSource podcastDataSource;

  @override
  Future<Either<Failure, List<PodcastEntity>>> search(String query) async {
    try {
      final podcastDtoList = await podcastDataSource.searchForPodcast(query);
      return Right(PodcastMapper.toEntity(podcastDtoList));
    } on PodcastNotFoundException {
      return const Left(PodcastNotFoundFailure());
    } catch (e, s) {
      return Left(Failure.unknown(error: e, stackTrace: s));
    }
  }
}
