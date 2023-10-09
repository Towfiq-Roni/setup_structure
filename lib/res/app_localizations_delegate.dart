import 'package:flutter/material.dart';
import '../../res/strings/english_strings.dart';
import '../../res/strings/japanese_strings.dart';
import '../../res/strings/strings.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Strings> {

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) => _load(locale);

  static Future<Strings> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return EnglishStrings();
      case 'ja':
        return JapaneseStrings();
      default:
        return EnglishStrings();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Strings> old) => false;
  
}