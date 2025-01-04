import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:state_manager/state_manager.dart';

class CounterViewModel extends BaseViewModel<CounterState> {
  CounterViewModel() : super(const CounterState());

  void changeCount() {
    state = CounterState(
      count: state.count + 1,
      color: state.color,
    );
  }

  void changeColor() {
    final random = Random();
    final index = random.nextInt(Colors.primaries.length);

    state = CounterState(
      count: state.count,
      color: Colors.primaries[index],
    );
  }
}

class CounterState extends Equatable {
  final int count;
  final Color color;

  const CounterState({
    this.count = 0,
    this.color = Colors.red,
  });

  @override
  List<Object?> get props => [count, color];

  @override
  bool? get stringify => true;

  @override
  String toString() {
    return '''CounterState {
      count: $count,
      color: $color
    }''';
  }
}
