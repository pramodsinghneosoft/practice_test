import 'package:flutter/material.dart';
import 'package:sqflite_test/bloc_pattern/bloc_model.dart';
import 'package:sqflite_test/get_it_files/service_locator_view.dart';

class BlocView extends StatefulWidget {
  @override
  _BlocViewState createState() => _BlocViewState();
}

class _BlocViewState extends State<BlocView> {
  var counterBloc = locator<CounterBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc View"),
      ),
      body: StreamBuilder(
          stream: counterBloc.counterStream,
          initialData: 0,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 40),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterEvent.Increment);
            },
            child: Text("+"),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterEvent.Decrement);
            },
            child: Text("-"),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterEvent.Reset);
            },
            child: Text("Reset"),
          ),
        ],
      ),
    );
  }
}
