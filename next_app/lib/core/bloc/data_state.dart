import 'package:either/failure.dart';
import 'package:equatable/equatable.dart';

base class DataState<Success> extends Equatable {
  const DataState({
    this.isInProgress = false,
    this.isFailure = false,
    this.isSuccess = false,
    this.data,
    this.failure,
  });

  final bool isInProgress;
  final bool isFailure;
  final bool isSuccess;
  final Success? data;
  final Failure? failure;

  DataState<Success> copyWith({
    final bool? isInProgress,
    final bool? isFailure,
    final bool? isSuccess,
    final Success? data,
    final Failure? failure,
  }) {
    return DataState(
      isInProgress: isInProgress ?? false,
      isFailure: isFailure ?? false,
      isSuccess: isSuccess ?? false,
      data: data,
      failure: failure,
    );
  }

  @override
  List<Object?> get props => [
        isInProgress,
        isFailure,
        isSuccess,
        data,
        failure,
      ];
}
