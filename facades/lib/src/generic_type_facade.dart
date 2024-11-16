import 'package:next_database_service/next_database_service.dart';

abstract class IGenericTypedFacade<Entity, Companion> {
  /// search for T in the remote database with API
  Future<List<Entity>> searchForRemoteList(String query);

  /// gets user selection in type of [Entity]
  /// converts it to [Companion]
  /// and persists in the local database
  Future<int> persistSelectedItem({
    required int collectionId,
    required Entity entity,
  });

  /// get local [Entity] of user within the given [collectionId]
  Future<List<Entity>> getListByCollectionId(
    int collectionId, {
    OrderOptions? orderOption,
  });

  /// search for user's list in the local database
  Future<List<Entity>> searchForLocalUserList({
    required String query,
    required int collectionId,
  });

  /// delete [Entity] in the given id from the local database
  Future<int> delete(int id);

  /// returns details of [Entity] within the given id from the local database
  Future<Entity> getLocalItemDetails(int id);

  Future<void> markAsDone(int id);

  Future<void> markAsUndone(int id);
}
