import 'package:either/failure.dart';
import 'package:equatable/equatable.dart';

sealed class DataState<Success> extends Equatable {
  const DataState();

  factory DataState.initial() => const DataInitial();
  factory DataState.inProgress() => const DataInProgress();
  factory DataState.failure(Failure failure) => DataFailure(failure);
  factory DataState.empty() => const DataEmpty();
  factory DataState.success(Success data) => DataSuccess(data);

  @override
  List<Object?> get props => [];
}

class DataInitial<Success> extends DataState<Success> {
  const DataInitial();
}

class DataInProgress<Success> extends DataState<Success> {
  const DataInProgress();
}

class DataFailure<Success> extends DataState<Success> {
  const DataFailure(this.failure);

  final Failure failure;
}

class DataEmpty<Success> extends DataState<Success> {
  const DataEmpty();
}

class DataSuccess<Success> extends DataState<Success> {
  const DataSuccess(this.data);

  final Success data;

  @override
  List<Object?> get props => [data];
}
