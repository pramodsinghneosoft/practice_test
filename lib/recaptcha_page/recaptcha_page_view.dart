import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite_test/package_info_page/package_info_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecaptchaPageView extends StatefulWidget {
  @override
  _RecaptchaPageViewState createState() => _RecaptchaPageViewState();
}

class _RecaptchaPageViewState extends State<RecaptchaPageView> {
  String verifyResult = "";
  bool isVisible = false;

  // RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();

  String apiKey = "6Ld5vscZAAAAAGxJGUpYFMAYJ-YW-gIb3TMMgqJN";
  String apiSecretKey = "6Ld5vscZAAAAAIu0Cug52B76w758BtMtdKt9Dk-u";

  WebViewController webViewController;
  final String pluginURL = "https://recaptcha-flutter-plugin.firebaseapp.com/";

  void verifyToken(String token) async {
    String url = "https://www.google.com/recaptcha/api/siteverify";
    http.Response response = await http.post(url, body: {
      "secret": "$apiSecretKey",
      "response": token,
    });

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      if (json['success']) {
        // Navigator.of(context).pop(true);
        setState(() {
          isVisible = true;

          verifyResult = "You've been verified successfully.";
        });
        // Future.delayed(Duration(milliseconds: 500), () {
        //   setState(() {
        //     isVisible = true;
        //   });
        // });
      } else {
        // Navigator.of(context).pop(false);
        setState(() {
          verifyResult = "Failed to verify.";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Queue4y"),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return PackageInfoView();
                }));
              },
              child: Text("Go to next Page"))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(verifyResult),
                isVisible
                    ? Text("")
                    : Container(
                        height: 600,
                        width: MediaQuery.of(context).size.width,
                        child: WebView(
                          // initialUrl: "https://serverUrl/recaptcha.html",
                          initialUrl: "$pluginURL?api_key=$apiKey",
                          javascriptMode: JavascriptMode.unrestricted,
                          javascriptChannels: <JavascriptChannel>[
                            JavascriptChannel(
                              name: 'RecaptchaFlutterChannel',
                              onMessageReceived: (JavascriptMessage receiver) {
                                // print(receiver.message);
                                String _token = receiver.message;
                                if (_token.contains("verify")) {
                                  _token = _token.substring(7);
                                }
                                // print(_token);
                                verifyToken(_token);
                              },
                            ),
                          ].toSet(),

                          onWebViewCreated: (WebViewController wc) {
                            webViewController = wc;
                            webViewController.getScrollY();
                          },
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void methodWithCaptcha(String captchaCode) {
    print("Code returned: " + captchaCode);
  }
}
