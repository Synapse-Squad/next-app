import 'package:flutter/material.dart';

import 'base_view_model.dart';
import 'view_state_mixin.dart';

abstract class SelectorBaseView<ViewModel extends BaseViewModel<S>, S, Selected>
    extends StatefulWidget {
  const SelectorBaseView({super.key});

  @override
  @override
  State<SelectorBaseView<ViewModel, S, Selected>> createState();
}

abstract class SelectorBaseViewState<ViewModel extends BaseViewModel<S>, S,
        Selected> extends State<SelectorBaseView<ViewModel, S, Selected>>
    with ViewStateMixin<ViewModel, S, Selected> {
  /// filter the selected state for UI
  late Selected _selectedState;

  /// public getter for the selected state
  Selected get viewState => _selectedState;

  /// select the state to be used in the UI
  /// this method should be implemented by the subclass

  bool buildWhen(Selected prev, Selected next) => true;

  @override
  void initState() {
    super.initState();
    initialize(context);
    _selectedState = select(viewModel.state);
  }

  @override
  void handleStateChanges(S newState) {
    if (!mounted) return;

    super.handleStateChanges(newState);

    final canRebuild = buildWhen(_selectedState, select(newState));
    final mustRebuild = shouldRebuild(viewState, select(newState));

    if (canRebuild && mustRebuild) {
      setState(() {
        _selectedState = select(newState);
        changeState(newState);
      });
    }
  }

  bool shouldRebuild(Selected prevState, Selected newState) {
    return prevState != newState;
  }

  @override
  void dispose() {
    close();
    super.dispose();
  }
}
