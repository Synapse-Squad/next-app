import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class BaseViewModel<State> {
  BaseViewModel(State initState) {
    _lastState = initState;
    _stateController = StreamController<State>.broadcast();
    _stateController!.add(initState);
  }

  late final StreamController<State>? _stateController;

  Stream<State> get stateStream => _stateController!.stream;

  late State? _lastState;
  State get state => _lastState!;

  set state(State state) {
    if (state == _lastState) return;
    if (_stateController!.isClosed) return;

    if (_stateController.hasListener) {
      _lastState = state;
      _stateController.add(state);
    }
  }

  @mustCallSuper
  void dispose() {
    _lastState = null;
    _stateController!.close();
    _stateController = null;
  }
}
