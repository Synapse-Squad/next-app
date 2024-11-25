import 'package:equatable/equatable.dart';

abstract base class UseCase<Result, Param extends Params> {
  const UseCase();

  Result execute(Param param);
}

abstract base class AsyncUseCase<Result, Param extends Params> {
  const AsyncUseCase();

  Future<Result> execute(Param param);
}

abstract base class Params extends Equatable {
  const Params();

  @override
  List<Object?> get props => [];
}

final class NoParam extends Params {
  const NoParam();
}

const noParam = NoParam();
