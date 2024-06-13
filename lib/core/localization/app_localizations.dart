import 'package:flutter/cupertino.dart';

class AppLocalization {
  AppLocalization._();

  static const Locale _uzLocale = Locale('uz', 'UZ');
  static const Locale _enLocale = Locale('en', 'US');
  static const Locale _ruLocale = Locale('ru', 'RU');
  static const Locale _frLocale = Locale('fr', 'FR');

  /// supported locales
  static const List<Locale> values = [_uzLocale, _enLocale, _ruLocale, _frLocale];

  static Locale get uzLocale => _uzLocale;

  static Locale get enLocale => _enLocale;

  static Locale get ruLocale => _ruLocale;

  static Locale get frLocale => _frLocale;
}
