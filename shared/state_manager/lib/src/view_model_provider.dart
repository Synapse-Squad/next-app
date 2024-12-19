import 'package:flutter/material.dart';

import 'base_view_model.dart';

class ViewModelProvider<ViewModel extends BaseViewModel<State>, State>
    extends InheritedWidget {
  const ViewModelProvider({
    super.key,
    required super.child,
    required this.viewModel,
  });

  final ViewModel viewModel;

  static ViewModel of<ViewModel extends BaseViewModel<State>, State>(
      BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<ViewModelProvider<ViewModel, State>>()!
        .viewModel;
  }

  @override
  bool updateShouldNotify(ViewModelProvider oldWidget) => false;
}
