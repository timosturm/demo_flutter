import 'package:flutter/material.dart';
import '../appTheme.dart' as appTheme;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localisations.dart';

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
      supportedLocales: [
        const Locale('en', ''),
        const Locale('de', ''),
      ],
      onGenerateTitle: (BuildContext c) => L10n.of(c).title,
      theme: appTheme.getTheme(),
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
//  final Set<WordPair> _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).title),
        leading: Padding(
          padding: EdgeInsets.all(4.0),
          child: Image.asset('assets/logo/logo.png'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
//              onPressed: _pushSaved
            onPressed: null,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(L10n.of(context).greeting),
            Divider(),
            Text(L10n.of(context).introductionWithName),
            Divider(),
            Text(L10n.of(context).introductionWithAge),
            Divider(),
            Text(L10n.of(context).questionHowAreYou),
            Divider(),
            Text(L10n.of(context).questionCanIHelp),
          ],
        ),
      ),
    );
  }

  Future<String> loadAsset(BuildContext context, key) async {
    return DefaultAssetBundle.of(context).loadString(key);
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
