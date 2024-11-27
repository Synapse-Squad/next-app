import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.debugMessage]);

  final String? debugMessage;

  factory Failure.noInternet([String? debugMessage]) =>
      NoInternetFailure(debugMessage);
  factory Failure.database([String? debugMessage]) =>
      DatabaseFailure(debugMessage);
  factory Failure.network([String? debugMessage]) =>
      NetworkFailure(debugMessage);
  factory Failure.unknown([String? debugMessage]) =>
      UnknownFailure(debugMessage);

  @override
  List<Object?> get props => [debugMessage];
}

class NoInternetFailure extends Failure {
  const NoInternetFailure([super.debugMessage]);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure([super.debugMessage]);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.debugMessage]);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.debugMessage]);
}
