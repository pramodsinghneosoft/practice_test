import 'package:hooks_riverpod/all.dart';
import 'package:sqflite_test/riverpod_page/counter_model.dart';

class CounterNotifier extends StateNotifier<CounterModel> {
  CounterNotifier() : super(_initialValue);

  static const _initialValue = CounterModel(0);

  void increment() {
    state = CounterModel(state.count + 1);
  }
}
