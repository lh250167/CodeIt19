import 'package:flutter/material.dart';
import 'package:shopper_buddy/Model/ProductsMocks.dart';
import 'package:shopper_buddy/Model/product.dart';
import 'package:shopper_buddy/views/category.dart';
import 'package:speech_recognition/speech_recognition.dart';

class MobileVoiceHome extends StatefulWidget {
  @override
  _MobileVoiceHomeState createState() => _MobileVoiceHomeState();
}

class _MobileVoiceHomeState extends State<MobileVoiceHome> {
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
      //height: 50,
      //margin: EdgeInsets.only(top: -10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 8.0,
                ),
                child: Text(
                  resultText,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(width: 14),
              FloatingActionButton(
                child: Icon(Icons.mic),
                onPressed: () {
                  if (_isAvailable && !_isListening)
                    _speechRecognition
                        .listen(locale: "en_US")
                        .then((result) => print('$result'));
                },
                backgroundColor: Colors.pink,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Route _createRoute(String category) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CategoryScreen(
        category: category,
        productList: getCategoryProducts(category),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  List<Product> getCategoryProducts(String category) {
    var categoryProducts = new List<Product>();
    for (var i = 0; i < productsList.length; i++) {
      if (productsList[i].category.name.toLowerCase() ==
          category.toLowerCase()) {
        categoryProducts.add(productsList[i]);
      }
    }
    return categoryProducts;
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() {
        resultText = '';
        _isListening = true;
      }),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() {
        resultText = speech;
      }),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() {
        _isListening = false;
        //sleep(const Duration(seconds: 2));

        String category = "Dairy";
        if (resultText == "sugar") category = "Dairy";
        if (resultText == "bread") category = "Bakery";
        resultText = "Search For Products";
        Navigator.of(context).push(_createRoute(category));
      }),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }
}
