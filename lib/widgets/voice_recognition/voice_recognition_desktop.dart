import 'package:flutter/material.dart';
import 'package:shopper_buddy/views/category.dart';
import 'package:speech_recognition/speech_recognition.dart';

class DesktopVoiceHome extends StatefulWidget {
  @override
  _DesktopVoiceHomeState createState() => _DesktopVoiceHomeState();
}

class _DesktopVoiceHomeState extends State<DesktopVoiceHome> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = "Search For Products";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PreferredSize(
              preferredSize: const Size.fromHeight(10.0),
              child: Container(
                width: 500,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Search For Products',
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Route _createRoute(String resultText) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CategoryScreen(
        category: resultText,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() {
        resultText = speech;
        Navigator.of(context).push(_createRoute(resultText));
      }),
    );

   
    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }
}
