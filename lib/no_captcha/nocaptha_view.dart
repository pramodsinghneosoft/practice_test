import 'package:flutter/material.dart';
// import 'package:flutter_recaptcha_v2/flutter_recaptcha_v2.dart';
import 'package:sqflite_test/no_captcha/recaptcha_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String verifyResult = "";

  // RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();

  String apiKey = "6Ld5vscZAAAAAGxJGUpYFMAYJ-YW-gIb3TMMgqJN";
  String apiSecretKey = "6Ld5vscZAAAAAIu0Cug52B76w758BtMtdKt9Dk-u";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Queue4y"),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("SHOW ReCAPTCHA"),
                  onPressed: () async {
                    // recaptchaV2Controller.show();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return RecaptchaView(
                          apiKey: apiKey,
                          apiSecret: apiSecretKey,
                        );
                      }),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          if (value) {
                            verifyResult = "You've been verified successfully.";
                          } else {
                            verifyResult = "Failed to verify.";
                          }
                        });
                      }
                    });
                  },
                ),
                Text(verifyResult),
              ],
            ),
          ),
          // RecaptchaV2(
          //   apiKey: "6Ld5vscZAAAAAGxJGUpYFMAYJ-YW-gIb3TMMgqJN",
          //   apiSecret: "6Ld5vscZAAAAAIu0Cug52B76w758BtMtdKt9Dk-u",
          //   controller: recaptchaV2Controller,
          //   onVerifiedError: (err) {
          //     print(err);
          //   },
          //   onVerifiedSuccessfully: (success) {
          //     setState(() {
          //       if (success) {
          //         verifyResult = "You've been verified successfully.";
          //       } else {
          //         verifyResult = "Failed to verify.";
          //       }
          //     });
          //   },
          // ),
        ],
      ),
    );
  }

  void methodWithCaptcha(String captchaCode) {
    print("Code returned: " + captchaCode);
  }
}
