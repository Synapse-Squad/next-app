import 'package:facades/facades.dart';
import 'package:itunes_service/itunes_service.dart';
import 'package:next_database_service/next_database_service.dart';

import 'podcast_mapper.dart';

typedef PodcastFacadeType
    = IGenericTypedFacade<PodcastEntity, PodcastsCompanion>;

final class PodcastFacade
    implements IGenericTypedFacade<PodcastEntity, PodcastsCompanion> {
  const PodcastFacade({
    required this.podcastRepository,
    required this.podcastsDao,
  });

  final IPodcastRepository podcastRepository;
  final PodcastsDao podcastsDao;

  @override
  Future<int> delete(int id) => podcastsDao.deleteById(id);

  @override
  Future<List<PodcastEntity>> getListByCollectionId(
    int collectionId, {
    OrderOptions? orderOption,
  }) async {
    final podcastRows = await podcastsDao.getListByCollectionId(
      collectionId,
      orderOption: orderOption,
    );

    return PodcastMapper.toEntityList(podcastRows);
  }

  @override
  Future<PodcastEntity> getLocalItemDetails(int id) async {
    final albumRow = await podcastsDao.get(id);
    return PodcastMapper.toEntity(albumRow);
  }

  @override
  Future<void> markAsDone(int id) => podcastsDao.markAsListened(id);

  @override
  Future<void> markAsUndone(int id) => podcastsDao.markAsNotListened(id);

  @override
  Future<int> persistSelectedItem({
    required int collectionId,
    required PodcastEntity entity,
  }) =>
      podcastsDao.add(
        PodcastMapper.toCompanion(
          collectionId: collectionId,
          podcast: entity,
        ),
      );

  @override
  Future<List<PodcastEntity>> searchForLocalUserList({
    required String query,
    required int collectionId,
  }) async {
    final podcastRows = await podcastsDao.search(
      query: query,
      collectionId: collectionId,
    );

    return PodcastMapper.toEntityList(podcastRows);
  }

  @override
  Future<List<PodcastEntity>> searchForRemoteList(String query) =>
      podcastRepository.search(query);
}
