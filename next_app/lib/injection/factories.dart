import 'package:flutter/foundation.dart';

abstract class Factory<T> {
  const Factory();

  @protected
  T create();
}

abstract class AsyncFactory<T> {
  const AsyncFactory();

  Future<T> create();
}
