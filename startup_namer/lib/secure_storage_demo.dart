import 'dart:math';

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

//  final storage = FlutterSecureStorage();
  final key = "key";
  List<String> valuesInput = List();

//  List<String> valuesStored = List();
  List<String> valuesStored = [];
  List<String> keysStored = [];

  final _valueController = TextEditingController();
  final storage = new FlutterSecureStorage();

  _clearValues() {
    setState(() {
      valuesStored.clear();
      keysStored.clear();
    });
  }

  _setValuesFromMap(Map<String, String> map) {
    var values = List<String>();
    map.forEach((key, value) => values.add(value));
    setState(() {
      valuesStored = values;
    });

    var keys = List<String>();
    map.forEach((key, value) => keys.add(key));
    setState(() {
      keysStored = keys;
    });
  }

  _deleteValue(String key) {
    storage.delete(key: key);
    storage.readAll().then((map) => {_setValuesFromMap(map)});
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
                          storage.write(
                              key: Random().nextDouble().toString(),
                              value: text);
                        }
                      },
                      child: Text('Save Value'),
                    ),
                  ),
                ],
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                storage.readAll().then((map) => {_setValuesFromMap(map)});
              },
              child: Text('Show all Values'),
            ),
            RaisedButton(
              onPressed: () {
                storage.deleteAll().then((_) => {_clearValues()});
              },
              child: Text('Delete All Values'),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemCount: valuesStored.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Value: ${valuesStored[index]}'),
                subtitle: Text('Key: ${keysStored[index]}'),
                onTap: () => _deleteValue(keysStored[index]),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        ),
      ],
    );
  }
}
