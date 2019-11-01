import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../l10n/messages_all.dart';

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

    // TODO it would be possible to load a json file as a map,
    //  and use that for the messages instead
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
