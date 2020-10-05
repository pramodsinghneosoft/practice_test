import 'dart:async';

enum CounterEvent { Increment, Decrement, Reset }

class CounterBloc {
  int counter;
  final _streamController = StreamController<int>();
  StreamSink<int> get counterSink => _streamController.sink;
  Stream<int> get counterStream => _streamController.stream;

  final _eventController = StreamController<CounterEvent>();

  StreamSink<CounterEvent> get eventSink => _eventController.sink;
  Stream<CounterEvent> get eventStream => _eventController.stream;

  CounterBloc() {
    counter = 0;
    eventStream.listen((event) {
      if (event == CounterEvent.Increment)
        counter++;
      else if (event == CounterEvent.Decrement)
        counter--;
      else if (event == CounterEvent.Reset) counter = 0;

      counterSink.add(counter);
    });
  }
  void dispose() {
    _streamController.close();
    _eventController.close();
  }
}
