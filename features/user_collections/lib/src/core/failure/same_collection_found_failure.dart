import 'package:either/either.dart';

class SameCollectionFoundFailure extends Failure {
  const SameCollectionFoundFailure({
    super.debugMessage,
    super.error,
    super.stackTrace,
});
}
