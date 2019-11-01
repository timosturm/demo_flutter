import 'package:flutter/material.dart';
import '../appTheme.dart' as appTheme;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localisationsWithJson.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: L10n.supportedLocales,
      onGenerateTitle: (BuildContext c) => L10n.translate('title'),
      theme: appTheme.getTheme(),
      home: MyList(),
    );
  }
}

class MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.translate('title')),
        leading: Padding(
          padding: EdgeInsets.all(4.0),
          child: Image.asset('assets/logo/logo.png'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(L10n.translate('greeting')),
            Divider(),
            Text(L10n.translate('introductionWithName')),
            Divider(),
            Text(L10n.translate('introductionWithAge')),
            Divider(),
            Text(L10n.translate('questionHowAreYou')),
            Divider(),
            Text(L10n.translate('questionCanIHelp')),
          ],
        ),
      ),
    );
  }
}

class MyList extends StatefulWidget {
  @override
  MyListState createState() => new MyListState();
}
