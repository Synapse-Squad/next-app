import 'package:flutter/material.dart';

import 'base_view_model.dart';

class ViewModelProvider<ViewModel extends BaseViewModel>
    extends InheritedWidget {
  const ViewModelProvider({
    super.key,
    required super.child,
    required this.viewModel,
  });

  final ViewModel viewModel;

  static ViewModel of<ViewModel extends BaseViewModel>(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<ViewModelProvider<ViewModel>>()!
        .viewModel;
  }

  @override
  bool updateShouldNotify(ViewModelProvider oldWidget) => false;
}
