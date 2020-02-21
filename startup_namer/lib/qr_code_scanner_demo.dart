import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'QR Code Scanner Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: QRCodeScanner(),
      ),
    );
  }
}

class QRCodeScanner extends StatefulWidget {
  @override
  QRCodeScannerState createState() {
    return QRCodeScannerState();
  }
}

class QRCodeScannerState extends State<QRCodeScanner> {
  var _imgUrl;
  var _code;
  final _backupUrl =
      'https://www.petmd.com/sites/default/files/senior-golden-retriever-with-ball-picture-id488657289.jpg';

  _scanQR() async {
    try {
//      BarcodeScanner.scan().then((v) => setState(() => this._imgUrl = v));
      String barcode = await BarcodeScanner.scan();
      setState(() {
        _imgUrl = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() => _code = 'The user did not grant the camera permission!');
      } else {
        setState(() => _code = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => _code =
          'Result null (User returned using the "back"-button before scanning anything.)');
    } catch (e) {
      setState(() => _code = 'Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      children: <Widget>[
        Text('Press key to scann qr code:'),
        RaisedButton(onPressed: _scanQR, child: Text('Scann')),
        Text('$_code'),
        Image.network(_imgUrl ?? _backupUrl),
      ],
    );
  }
}
