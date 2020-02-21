import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<int> list = List.generate(1000, (x) => x);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          body: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                return SuperDuperWidget(list[i]);
              })),
    );
  }
}

class SuperDuperWidget extends StatefulWidget {
  final int number;

  SuperDuperWidget(this.number);

  @override
  State<StatefulWidget> createState() => SuperDuperWidgetState();
}

class SuperDuperWidgetState extends State<SuperDuperWidget> {
  @override
  void initState() {
    super.initState();
    print("I present ${widget.number}");
  }

  @override
  Widget build(BuildContext context) {
//    print('I build ${widget.number}!');

    return ListTile(
      title: Text("${widget.number}"),
    );
  }
}
