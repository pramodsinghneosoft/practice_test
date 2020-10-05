import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:sqflite_test/speech_to_text_view.dart/speech_dialog_view.dart';

class SearchSpeechTextView extends StatefulWidget {
  @override
  _SearchSpeechTextViewState createState() => _SearchSpeechTextViewState();
}

class _SearchSpeechTextViewState extends State<SearchSpeechTextView> {
  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = "hello";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();
  bool isValue = false;

  @override
  void initState() {
    initSpeechState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Speech View")),
      body: Container(
        child: Column(
          children: [
            searchTextField(),
            Container(
              color: Theme.of(context).selectedRowColor,
              child: Center(
                child: Text(
                  lastWords,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            suffixIcon: isValue
                ? _micIcon()
                : InkWell(
                    onTap: showSpeechDialog,
                    child: Icon(Icons.mic, color: Colors.grey)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            filled: true,
            fillColor: Colors.white60,
            contentPadding: EdgeInsets.all(15.0),
            hintText: "Search here"),
        onChanged: (value) {},
      ),
    );
  }

  Widget _micIcon() {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: .26,
              spreadRadius: level * 1.5,
              color: Colors.black.withOpacity(.05))
        ],
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: IconButton(
          onPressed: () {
            setState(() {
              isValue = false;
            });
          },
          icon: Icon(Icons.mic)),
    );
  }

  void showSpeechDialog() async {
    FocusScope.of(context).unfocus();

    setState(() {
      isValue = true;
    });
    startListening();
  }

  Future<void> initSpeechState() async {
    print("initSpeechState called");
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      isValue = false;
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    // print(
    // "Received listener status: $status, listening: ${speech.isListening}");
    setState(() {
      lastStatus = "$status";
    });
  }

  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 10),
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      isValue = false;

      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      isValue = false;

      lastWords = "${result.recognizedWords} - ${result.finalResult}";
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }
}
