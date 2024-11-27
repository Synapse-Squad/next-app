library either;

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

export 'failure.dart';

abstract class Either<L, R> extends Equatable {
  const Either();

  T fold<T>({
    required T Function(L left) onLeft,
    required T Function(R right) onRight,
  });

  @override
  List<Object?> get props => [];
}

class Left<L, R> extends Either<L, R> {
  final L value;

  const Left(this.value);

  @override
  T fold<T>({
    required T Function(L left) onLeft,
    required T Function(R right) onRight,
  }) {
    return onLeft(value);
  }

  @override
  List<Object?> get props => [value];
}

class Right<L, R> extends Either<L, R> {
  final R value;

  const Right(this.value);

  @override
  T fold<T>({
    required T Function(L left) onLeft,
    required T Function(R right) onRight,
  }) {
    return onRight(value);
  }

  @override
  List<Object?> get props => [value];
}

extension EitherExtensions<L, R> on Either<L, R> {
  bool isLeft() => this is Left<L, R>;
  bool isRight() => this is Right<L, R>;

  L? getLeft() => this is Left<L, R> ? (this as Left<L, R>).value : null;
  R? getRight() => this is Right<L, R> ? (this as Right<L, R>).value : null;
  //
  // Either<L, T> mapRight<T>(T Function(R right) transform) {
  //   return fold(
  //     (left) => Left<L, T>(left),
  //     (right) => Right<L, T>(transform(right)),
  //   );
  // }
  //
  // Either<T, R> mapLeft<T>(T Function(L left) transform) {
  //   return fold(
  //     (left) => Left<T, R>(transform(left)),
  //     (right) => Right<T, R>(right),
  //   );
  // }
}

@immutable
class Unit {
  const Unit._internal();

  @override
  String toString() => '()';
}

const Unit unit = Unit._internal();
