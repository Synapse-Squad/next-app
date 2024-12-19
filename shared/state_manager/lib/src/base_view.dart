import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:state_manager/src/view_model_provider.dart';

import 'base_view_model.dart';

abstract class BaseView<ViewModel extends BaseViewModel<S>, S>
    extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState();
}

abstract class BaseViewState<ViewModel extends BaseViewModel<S>, S>
    extends State<BaseView<ViewModel, S>> {
  late final ViewModel _viewModel;
  StreamSubscription<S>? _stateListener;
  late S _viewState;

  /// Current view state
  S get viewState => _viewState;

  /// Current view model
  ViewModel get viewModel => _viewModel;

  bool buildWhen(S prev, S next) => true;

  bool listenWhen(S prev, S next) => true;

  @override
  void initState() {
    super.initState();

    _viewModel = viewModelBuilder(context);

    /// initial state for view
    _viewState = _viewModel.state;

    _stateListener = _viewModel.stateStream.listen(
      (newState) {
        if (!mounted) return;

        if (listenWhen(_viewState, newState)) {
          listen(_viewState, newState);
        }

        if (buildWhen(_viewState, newState)) {
          setState(() => _viewState = newState);
        }
      },
      onError: (error) {
        debugPrintThrottled('Error in $ViewModel: $error');
      },
    );
  }

  ViewModel viewModelBuilder(BuildContext context) {
    return ViewModelProvider.of(context);
  }

  void listen(S prev, S next) {}

  @override
  void dispose() {
    super.dispose();
    _stateListener?.cancel();
    _viewModel.dispose();
    _stateListener = null;
  }
}
