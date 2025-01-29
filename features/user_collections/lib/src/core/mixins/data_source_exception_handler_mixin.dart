import 'package:next_database_service/next_database_service.dart';

import '../exceptions/user_collection_exceptions.dart';

mixin DataSourceExceptionHandlerMixin {
  Future<T> handleException<T>(Future<T> Function() expression) async {
    try {
      return await expression();
    } on DatabaseException catch (error, stackTrace) {
      Error.throwWithStackTrace(
        UserCollectionException(error.message),
        stackTrace,
      );
    } catch (error) {
      throw UserCollectionException(error.toString());
    }
  }
}
