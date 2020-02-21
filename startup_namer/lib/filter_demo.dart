import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    items: List<String>.generate(10000, (i) => "Item $i"),
  ));
}

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: ListView(
            children: <Widget>[
              Text('0'),
              Text('1'),
              Text('2'),
              Text('3'),
              Text('4'),
              Stack(
                children: <Widget>[
                  Text('Blur me!'),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        child: Text(
                          'Blur me!',
                          style: TextStyle(color: Colors.white.withOpacity(0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text('5'),
              Text('6'),
              Text('7'),
              Text('8'),
            ],
          )),
    );
  }
}
