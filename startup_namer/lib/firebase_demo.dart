import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "appName",
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: PushMessaging(),
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
      //var map2 = map['notification'];
      if (map['notification'] != null) {
        print('This is a notification message:');
      } else {
        print('This is a data message:');
      }

      debugPrint("$map");

      _msg = map.toString();
      //String title = map2['title'];
      //String body = map2['body'];

      //print(map);

      //_msg = "Title: $title | Body: $body";
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
      onBackgroundMessage: myBackgroundMessageHandler,
    );

    _firebaseMessaging.getToken().then((token) {
      print("FCM token: $token");
    });
  }

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
      debugPrint('Background data!');
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
      debugPrint('Background notification!');
    }

    // Or do other work.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FCM Demo"),
      ),
      body: Center(
        child: Text("Something: $_msg."),
      ),
    );
  }
}
