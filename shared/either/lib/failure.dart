import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({
    this.debugMessage,
    this.error,
    this.stackTrace,
  });

  final String? debugMessage;
  final dynamic error;
  final StackTrace? stackTrace;

  factory Failure.noInternet({
    String? debugMessage,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      NoInternetFailure(
        debugMessage: debugMessage,
        error: error,
        stackTrace: stackTrace,
      );

  factory Failure.database({
    String? debugMessage,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      DatabaseFailure(
        debugMessage: debugMessage,
        error: error,
        stackTrace: stackTrace,
      );

  factory Failure.network({
    String? debugMessage,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      NetworkFailure(
        debugMessage: debugMessage,
        error: error,
        stackTrace: stackTrace,
      );

  factory Failure.unknown({
    String? debugMessage,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      UnknownFailure(
        debugMessage: debugMessage,
        error: error,
        stackTrace: stackTrace,
      );

  @override
  List<Object?> get props => [debugMessage, error, stackTrace];

  @override
  bool? get stringify => true;
}

class NoInternetFailure extends Failure {
  const NoInternetFailure({
    super.debugMessage,
    super.error,
    super.stackTrace,
  });
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({
    super.debugMessage,
    super.error,
    super.stackTrace,
  });
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.debugMessage,
    super.error,
    super.stackTrace,
  });
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    super.debugMessage,
    super.error,
    super.stackTrace,
  });
}
