import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static Map<String, dynamic>? _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('assets/jsondata/data.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap;
    return true;
  }

  String? translate(String key) {
    return _localizedStrings?[locale.languageCode]?[key];
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'hi', 'gu'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}


class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('hi');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!['en', 'hi', 'gu'].contains(locale.languageCode)) return;
    _locale = locale;
    notifyListeners();
  }
}
