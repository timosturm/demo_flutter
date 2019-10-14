import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Custom Themes';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: PushMessaging(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: Text(
            'Just some placeholder text.',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}

class PushMessaging extends StatefulWidget {
  @override
  _PushMessagingState createState() => _PushMessagingState();
}

class _PushMessagingState extends State<PushMessaging> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String _msg = '';

  void _onMessage(Map<String, dynamic> map) {
    setState(() {
//      _msg = map.toString();
      var map2 = map['notification'];
      String title = map2['title'];
      String body = map2['body'];

      print(map);

      _msg = "Title: $title | Body: $body";
    });
  }

  void _onLaunch(map) {
    _onMessage(map);
  }

  void _onResume(map) {
    _onMessage(map);
  }

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _onMessage(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _onLaunch(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _onResume(message);
      },
    );

    _firebaseMessaging.getToken().then((token) {
      print("FCM token: $token");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is a title."),
      ),
      body: Center(
        child: Text("Something: $_msg."),
      ),
    );
  }
}
