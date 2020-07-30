import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopper_buddy/Model/Shipping_DetailsMocks.dart';
import 'package:shopper_buddy/views/category.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

class PaymentDetailsContentMobile extends StatefulWidget {
  const PaymentDetailsContentMobile(BuildContext context, {Key key, this.title})
      : super(key: key);

  final String title;

  @override
  _PaymentDetailsContentMobileState createState() =>
      _PaymentDetailsContentMobileState();
}

class _PaymentDetailsContentMobileState
    extends State<PaymentDetailsContentMobile> {
  bool payWithCash = false;
  bool payWithCreditCard = false;
  VoiceController _voiceController;

  String shippingAddress = 'shipping Address, to: ' +
      ShippingsDetails[0].name.toString() +
      'Street ' +
      ShippingsDetails[0].street.toString() +
      ' ' +
      ShippingsDetails[0].houseNumber.toString() +
      ' ' +
      ShippingsDetails[0].city.toString();

  void initState() {
    _voiceController = FlutterTextToSpeech.instance.voiceController();
    super.initState();
  }

  _playVoice() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        shippingAddress,
        VoiceControllerOptions(),
      );
    });
  }

  _stopVoice() {
    _voiceController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Table(
        //border: TableBorder.all(color: Colors.black),
        children: [
          TableRow(children: [
            TableCell(
                child: Text('Total: 100\$',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                verticalAlignment: TableCellVerticalAlignment.middle),
            _heightSpacer()
          ]),
          TableRow(children: [_heightSpacer(), _heightSpacer()]),
          TableRow(children: [
            TableCell(
                child: Text('Pay With Cash Upon Delivery'),
                verticalAlignment: TableCellVerticalAlignment.middle),
            TableCell(
                child: Checkbox(
                  value: payWithCash,
                  onChanged: (bool value) {
                    setState(() {
                      if (payWithCash == false)
                        payWithCash = true;
                      else
                        payWithCash = false;
                      //monVal = value;
                    });
                  },
                ),
                verticalAlignment: TableCellVerticalAlignment.middle),
          ]),
          //TableRow(children: [_heightSpacer(), _heightSpacer()]),
          TableRow(children: [
            TableCell(
                child: Text('Pay With credit card'),
                verticalAlignment: TableCellVerticalAlignment.middle),
            TableCell(
                child: Checkbox(
                  value: payWithCreditCard,
                  onChanged: (bool value) {
                    setState(() {
                      if (payWithCreditCard == false)
                        payWithCreditCard = true;
                      else
                        payWithCreditCard = false;
                      //monVal = value;
                    });
                  },
                ),
                verticalAlignment: TableCellVerticalAlignment.middle),
          ]),
          TableRow(children: [_heightSpacer(), _heightSpacer()]),
          TableRow(children: [
            TableCell(
                child: Text('Shipping Address:',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                verticalAlignment: TableCellVerticalAlignment.middle),
            TableCell(
                child: IconButton(
                  icon: Icon(Icons.volume_up),
                  color: Colors.lightBlue[300],
                  iconSize: 60,
                  tooltip: "Shipping Address",
                  onPressed: _playVoice,
                ),
                verticalAlignment: TableCellVerticalAlignment.middle)
          ]),
          TableRow(children: [Text('NCR Cooporation'), _heightSpacer()]),
          TableRow(children: [Text('Dafna St'), _heightSpacer()]),
          TableRow(children: [Text('Raanana'), _heightSpacer()]),
          TableRow(children: [
            SizedBox(
              width: 20,
              child: RaisedButton(
                onPressed: () {},
                child: Text("Confirm"),
              ),
            ),
            _heightSpacer()
          ]),
        ],
      ),
    );
  }
}

Widget _widthSpacer() {
  return SizedBox(
    width: 30,
  );
}

Widget _heightSpacer() {
  return SizedBox(height: 30);
}

Widget _buildCard(String category, Color color) => SizedBox(
      height: 180,
      width: 400,
      child: Card(
        color: color,
        child: Column(
          children: [
            Image.asset(
              'assets/' + category + '.png',
              height: 110,
              width: double.infinity,
              fit: BoxFit.scaleDown,
              semanticLabel: category,
            ),
            ListTile(
                onTap: () => _createRoute(category),
                title: new Center(
                  child: Text(category,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          height: 0.9,
                          fontSize: 20,
                          color: Colors.white)),
                ))
          ],
        ),
      ),
    );

Route _createRoute(String category) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CategoryScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
