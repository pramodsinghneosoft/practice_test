import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite_test/sqflite_files/alarm_model.dart';
import 'package:sqflite_test/sqflite_files/clock_view.dart';
import 'package:sqflite_test/sqflite_files/sqflite_helper.dart';

class SQFLiteView extends StatefulWidget {
  @override
  _SQFLiteViewState createState() => _SQFLiteViewState();
}

class _SQFLiteViewState extends State<SQFLiteView> {
  DateTime dateTime;
  SQFLiteHelper _sqfLiteHelper = SQFLiteHelper();
  Future<List<AlarmModel>> _alarms;

  @override
  void initState() {
    dateTime = DateTime.now();
    _sqfLiteHelper.initializeDatabase().then((value) {
      print("------database initialized");
      loadAlarms();
    });
    super.initState();
  }

  void loadAlarms() {
    _alarms = _sqfLiteHelper.getAlarm();
    _alarms.then((value) => print("alarm name: " + value[0].title));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat("HH:mm").format(now);
    var formattedDate = DateFormat("EEE, d MMM").format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMenuButton("Clock", "assets/clock.png"),
              buildMenuButton("Alarm", "assets/alarm.png"),
              buildMenuButton("Timer", "assets/timer.png"),
              buildMenuButton("Stopwatch", "assets/stopwatch.png"),
            ],
          ),
          VerticalDivider(color: Colors.white54, width: 1),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        "Clock",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            formattedTime,
                            style: TextStyle(fontSize: 64, color: Colors.white),
                          ),
                          SizedBox(height: 32),
                          Text(
                            formattedDate,
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Align(
                            alignment: Alignment.center,
                            child: ClockView(
                              size: 250,
                            ))),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Timezone",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          SizedBox(height: 16),
                          Row(children: <Widget>[
                            Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            SizedBox(width: 16),
                            Text(
                              "UTC" + offsetSign + timezoneString,
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ])
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Padding buildMenuButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: FlatButton(
          onPressed: () {},
          child: Column(children: <Widget>[
            Image.asset(
              image,
              scale: 1.5,
              color: Colors.white,
            ),
            Text(
              title ?? "",
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ])),
    );
  }
}

var alarmModel = AlarmModel(
    alarmDateTime: (DateTime.now()), gradientColorIndex: 1, title: "alarm");
