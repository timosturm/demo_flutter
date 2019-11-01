import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class L10n {
  const L10n();

  static Future<L10n> load(Locale locale) async {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    loadJson(localeName);

    return L10n();
  }

  static Map<String, String> _localized;

  static loadJson(localName) async {
    // load json file as asset (ref. pubspec.yaml -> assets)
    String jsonString = await rootBundle.loadString('i18n/$localName.json');

    Map<String, dynamic> map = jsonDecode(jsonString);
    _localized = map.cast<String, String>();
  }

  static String translate(String key) {
    // return corresponding value or message that the resource does not exist
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
