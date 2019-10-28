import 'package:flutter/material.dart';
import '../appTheme.dart' as appTheme;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import '../l10n/messages_all.dart';

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

class L10n {
  String localeName;

  L10n(this.localeName);

  static Future<L10n> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return L10n(localeName);
    });
  }

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
      desc: 'Title for the Demo application',
      locale: localeName,
    );
  }

  String get greeting {
    return Intl.message(
      'Good Day.',
      name: 'greeting',
      desc: 'Greeting the user of the app',
      locale: localeName,
    );
  }

  String get introductionWithName {
    return Intl.message(
      'My name is x.',
      name: 'introductionWithName',
      desc: 'Greeting the user of the app',
      locale: localeName,
    );
  }

  String get introductionWithAge {
    return Intl.message(
      'I am y years old.',
      name: 'introductionWithAge',
      desc: 'Greeting the user of the app',
      locale: localeName,
    );
  }

  String get questionHowAreYou {
    return Intl.message(
      'How are you today?',
      name: 'questionHowAreYou',
      desc: 'Greeting the user of the app',
      locale: localeName,
    );
  }

  String get questionCanIHelp {
    return Intl.message(
      'How may I help you?',
      name: 'questionCanIHelp',
      desc: 'Greeting the user of the app',
      locale: localeName,
    );
  }
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<L10n> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'de'].contains(locale.languageCode);
  }

  @override
  Future<L10n> load(Locale locale) {
    return L10n.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<L10n> old) {
    return false;
  }
}
