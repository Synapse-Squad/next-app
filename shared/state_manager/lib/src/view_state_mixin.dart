import 'dart:async';

import 'package:flutter/widgets.dart';

import 'base_view_model.dart';
import 'view_model_provider.dart';

mixin ViewStateMixin<ViewModel extends BaseViewModel<S>, S, Selected> {
  late final ViewModel _viewModel;
  StreamSubscription<S>? _stateListener;
  void Function(S state)? _listenerCallback;

  late S _viewState;

  /// The view model instance
  ViewModel get viewModel => _viewModel;

  bool listenWhen(Selected prev, Selected next) => prev != next;

  Selected select(S state);

  void initialize(BuildContext context) {
    _viewModel = _viewModelBuilder(context);
    _viewState = viewModel.state;
    _stateListener = _viewModel.stateStream.listen(handleStateChanges);
  }

  void listen(void Function(S state) callback) {
    if (_listenerCallback != null) return;
    _listenerCallback = callback;
  }

  @protected
  @visibleForTesting
  void changeState(S newState) {
    _viewState = newState;
  }

  @protected
  @visibleForTesting
  void handleStateChanges(S newState) {
    // Call listener if any

    if (_listenerCallback != null &&
        listenWhen(select(_viewState), select(newState))) {
      _listenerCallback?.call(newState);
    }
  }

  ViewModel _viewModelBuilder(BuildContext context) {
    return ViewModelProvider.of<ViewModel>(context);
  }

  @mustCallSuper
  void close() {
    _stateListener?.cancel();
    _stateListener = null;
    _listenerCallback = null;
  }
}
