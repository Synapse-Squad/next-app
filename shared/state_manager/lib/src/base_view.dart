import 'package:flutter/widgets.dart';

import 'base_view_model.dart';
import 'view_state_mixin.dart';
import 'package:meta/meta.dart';

abstract class BaseView<ViewModel extends BaseViewModel<S>, S>
    extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView<ViewModel, S>> createState();
}

abstract class BaseViewState<ViewModel extends BaseViewModel<S>, S>
    extends State<BaseView<ViewModel, S>> with ViewStateMixin<ViewModel, S, S> {
  @override
  void initState() {
    super.initState();
    initialize(context);
  }

  S get viewState => viewModel.state;

  @internal
  @protected
  @visibleForTesting
  @override
  S select(S state) => state;

  bool buildWhen(S prev, S next) => true;

  @internal
  @protected
  @override
  void handleStateChanges(S newState) {
    if (!mounted) return;

    super.handleStateChanges(newState);

    if (buildWhen(viewState, newState)) {
      setState(() {
        changeState(newState);
      });
    }
  }

  @override
  void dispose() {
    close();
    super.dispose();
  }
}
