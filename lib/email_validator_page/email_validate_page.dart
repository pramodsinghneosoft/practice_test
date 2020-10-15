import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class EmailValidatorPage extends StatefulWidget {
  @override
  _EmailValidatorPageState createState() => _EmailValidatorPageState();
}

class _EmailValidatorPageState extends State<EmailValidatorPage> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Email Validator view")),
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
          )
        ],
      )),
    );
  }
}
