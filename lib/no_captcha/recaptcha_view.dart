import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class RecaptchaView extends StatefulWidget {
  String apiKey;
  String apiSecret;
  RecaptchaView({this.apiKey, this.apiSecret});
  @override
  _RecaptchaViewState createState() => _RecaptchaViewState();
}

class _RecaptchaViewState extends State<RecaptchaView> {
  WebViewController webViewController;
  final String pluginURL = "https://recaptcha-flutter-plugin.firebaseapp.com/";

  void verifyToken(String token) async {
    String url = "https://www.google.com/recaptcha/api/siteverify";
    http.Response response = await http.post(url, body: {
      "secret": "${widget.apiSecret}",
      "response": token,
    });

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      if (json['success']) {
        Navigator.of(context).pop(true);
      } else {
        Navigator.of(context).pop(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Queue4y"),
      ),
      body: Center(
        child: WebView(
          // initialUrl: "https://serverUrl/recaptcha.html",
          initialUrl: "$pluginURL?api_key=${widget.apiKey}",
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
          // Set.from([
          //   JavascriptChannel(
          //       name: "RecaptchaView",
          //       onMessageReceived: (JavascriptMessage message) {
          //         widget.callback(message.message);
          //         Navigator.of(context).pop();
          //       })
          // ]),
          onWebViewCreated: (WebViewController wc) {
            webViewController = wc;
          },
        ),
      ),
    );
  }
}
