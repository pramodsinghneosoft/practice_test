import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:sqflite_test/email_validator_page/layoutBuilder_view.dart';

class EmailValidatorPage extends StatefulWidget {
  @override
  _EmailValidatorPageState createState() => _EmailValidatorPageState();
}

class _EmailValidatorPageState extends State<EmailValidatorPage> {
  final _controller = TextEditingController();
  var rating = 3.0;
  StreamController<double> _streamcontroller =
      StreamController<double>.broadcast();
  StreamSubscription<double> _streamSubscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email Validator view"),
        actions: [
          FlatButton(
              onPressed: () {
                Get.to(LayoutBuildView());
              },
              child: Text("Go to second page"))
        ],
      ),
      body: Container(
          child: Column(
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Enter mail Id"),
          ),
          FlatButton(
            child: Text("Submit"),
            onPressed: () {
              bool isValid = EmailValidator.validate(_controller.text);
              print(isValid);
            },
          ),
          Center(
            child: Loading(
                indicator: BallPulseIndicator(), color: Colors.red, size: 50.0),
          ),
          ratingBar(),
          _streamWidget(),
        ],
      )),
    );
  }

  ratingBar() {
    return SmoothStarRating(
      rating: rating,
      isReadOnly: false,
      size: 40,
      filledIconData: Icons.star,
      halfFilledIconData: Icons.star_half,
      defaultIconData: Icons.star_border,
      starCount: 5,
      allowHalfRating: true,
      spacing: 2.0,
      onRated: (value) {
        print("rating value -> $value");
        // print("rating value dd -> ${value.truncate()}");
      },
    );
  }

  Widget _streamWidget() {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {
            Stream stream = _streamcontroller.stream;
            _streamSubscription = stream.listen((event) {
              print("value from stream $event");
            });
          },
          child: Text("Subscribe"),
        ),
        MaterialButton(
          onPressed: () {
            _streamcontroller.sink.add(12.0);
          },
          child: Text("Enter value"),
        ),
        MaterialButton(
          onPressed: () {
            _streamSubscription.cancel();
          },
          child: Text("Cancel"),
        ),
      ],
    );
  }
}
