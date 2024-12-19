import 'package:flutter/material.dart';
import 'package:next_app/counter_view_model.dart';
import 'package:state_manager/state_manager.dart';

class CounterPage extends BaseView<CounterViewModel, int> {
  const CounterPage({super.key});

  @override
  State<BaseView<BaseViewModel, dynamic>> createState() => _CounterPageState();
}

class _CounterPageState extends BaseViewState<CounterViewModel, int> {
  @override
  bool listenWhen(int prev, int next) => next < 3;

  @override
  bool buildWhen(int prev, int next) => next > 0 && next < 5;

  @override
  void listen(int prev, int next) {
    debugPrint('Prev: $prev, Next: $next');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Current count: $viewState'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: viewModel.increment,
            child: Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: viewModel.decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
