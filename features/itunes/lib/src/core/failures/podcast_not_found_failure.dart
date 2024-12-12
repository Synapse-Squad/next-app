import 'package:either/either.dart';

class PodcastNotFoundFailure extends Failure {
  const PodcastNotFoundFailure({
    super.debugMessage,
    super.error,
    super.stackTrace,
  });
}
