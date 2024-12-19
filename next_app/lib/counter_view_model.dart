import 'package:state_manager/state_manager.dart';

class CounterViewModel extends BaseViewModel<int> {
  CounterViewModel() : super(0);

  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }
}
