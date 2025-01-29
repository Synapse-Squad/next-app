import 'package:drift/native.dart';

import '../extensions/database_exception.dart';

mixin GatewayExceptionHandlerMixin {
  Future<T> handle<T>(Future<T> Function() expression) async {
    try {
      return await expression();
    } on SqliteException catch (error, stackTrace) {
      Error.throwWithStackTrace(
        DatabaseAccessException(error.message),
        stackTrace,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        UnknownDatabaseException(error.toString()),
        stackTrace,
      );
    }
  }
}
