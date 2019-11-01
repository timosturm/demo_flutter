import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class L10n {
  // the purpose of these methods is to handle the localization
  // and the supported languages at one point in the code base
  static List<String> _supportedLanguages = ['en', 'de'];

  static List<String> get supportedLanguages {
    return _supportedLanguages;
  }

  static Iterable<Locale> get supportedLocales {
    List<Locale> locales = List();

    _supportedLanguages.forEach((lang) {
      locales.add(new Locale(lang, ''));
    });

    return Iterable.castFrom(locales);
  }

  // default load method, see: https://flutter.dev/docs/development/accessibility-and-localization/internationalization#dart-tools
  static Future<L10n> load(Locale locale) async {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    loadJson(localeName);

    return L10n();
  }

  static Map<String, String> _localized;

  // load the json file containing the strings and save it as _localized
  static loadJson(localName) async {
    // load json file as asset (ref. pubspec.yaml -> assets)
    String jsonString = await rootBundle.loadString('i18n/$localName.json');

    Map<String, dynamic> map = jsonDecode(jsonString);
    _localized = map.cast<String, String>();
  }

  // return corresponding value or message that the resource does not exist
  static String translate(String key) {
    return _localized[key] ?? '### Missing String! $key ###';
  }

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<L10n> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return L10n.supportedLanguages.contains(locale.languageCode);
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
