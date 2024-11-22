abstract base class UseCase<Result, Params> {
  const UseCase();

  Result execute(Params param);
}

abstract base class AsyncUseCase<Result, Params> {
  const AsyncUseCase();

  Future<Result> execute(Params param);
}

abstract base class Params {
  const Params();
}

final class NoParam extends Params {
  const NoParam();
}

const noParam = NoParam();
