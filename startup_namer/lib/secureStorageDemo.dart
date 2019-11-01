import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Secure Storage Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var currentValue;

//  final storage = FlutterSecureStorage();
  final key = "key";
  List<String> valuesInput = List();
  List<String> valuesStored = List();

  final _valueController = TextEditingController();

  _saveValues(value) {
    // TODO check plugin implementation in terms of security
//    FlutterKeychain.put(key: key, value: value);
  }

  _showValues() {
    // TODO check plugin implementation in terms of security
//    FlutterKeychain.get(key: key).then(print);
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _valueController,
                    decoration: new InputDecoration(
                        hintText: "Value to save securely."),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
// Validate returns true if the form is valid, or false
// otherwise.
                        if (_formKey.currentState.validate()) {
// If the form is valid, display a Snackbar.
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                          String text = _valueController.text;
                          _valueController.clear();
                          _saveValues(text);
                          _showValues();
                          setState(() {
                            valuesInput.add(text);
                          });
                        }
                      },
                      child: Text('Save Value'),
                    ),
                  ),
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: RaisedButton(
            onPressed: () {
              // TODO
            },
            child: Text('Show all Values'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            onPressed: () {
              // TODO
            },
            child: Text('Delete All Values'),
          ),
        ),
      ],
    );
  }
}
