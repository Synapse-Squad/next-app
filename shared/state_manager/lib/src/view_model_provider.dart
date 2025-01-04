import 'package:flutter/material.dart';

import 'base_view_model.dart';

class ViewModelProvider<ViewModel extends BaseViewModel>
    extends StatefulWidget {
  const ViewModelProvider({
    super.key,
    required this.viewModel,
    required this.child,
  });

  final ViewModel viewModel;
  final Widget child;

  @override
  State<ViewModelProvider> createState() =>
      _ViewModelProviderState<ViewModel>();

  static ViewModel of<ViewModel extends BaseViewModel>(BuildContext context) {
    return _ViewModelInherited.of<ViewModel>(context);
  }
}

class _ViewModelProviderState<ViewModel extends BaseViewModel>
    extends State<ViewModelProvider<ViewModel>> {
  @override
  Widget build(BuildContext context) {
    return _ViewModelInherited(
      viewModel: widget.viewModel,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }
}

class _ViewModelInherited<ViewModel extends BaseViewModel>
    extends InheritedWidget {
  const _ViewModelInherited({
    super.key,
    required super.child,
    required this.viewModel,
  });

  final ViewModel viewModel;

  static ViewModel of<ViewModel extends BaseViewModel>(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<_ViewModelInherited<ViewModel>>()!
        .viewModel;
  }

  @override
  bool updateShouldNotify(_ViewModelInherited oldWidget) => false;
}
