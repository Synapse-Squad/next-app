import 'package:flutter/material.dart';
import 'package:next_app/counter_view_model.dart';
import 'package:state_manager/state_manager.dart';

class CounterPage extends BaseView<CounterViewModel, CounterState> {
  const CounterPage({super.key});

  @override
  State<BaseView<CounterViewModel, CounterState>> createState() {
    return _CounterPageState();
  }
}

class _CounterPageState extends BaseViewState<CounterViewModel, CounterState> {
  // @override
  // bool buildWhen(int prev, int next) => next % 2 == 0;

  // @override
  // bool listenWhen(int prev, int next) => next > 10;

  @override
  CounterState select(CounterState state) {
    return state;
  }

  @override
  Widget build(BuildContext context) {
    print('Building CounterPage');

    listen(
      (state) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text('Count reached ${state.count}')),
          );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$viewState',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            // ColoredBox(
            //   color: viewState.color,
            //   child: const Text('Color changes will be here'),
            // ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: viewModel.changeCount,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: viewModel.changeColor,
            tooltip: 'Change color',
            child: const Icon(Icons.color_lens),
          ),
        ],
      ),
    );
  }
}
