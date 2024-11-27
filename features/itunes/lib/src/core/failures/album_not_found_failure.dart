import 'package:either/either.dart';

class AlbumNotFoundFailure extends Failure {
  const AlbumNotFoundFailure({
    super.debugMessage,
    super.error,
    super.stackTrace,
  });
}
