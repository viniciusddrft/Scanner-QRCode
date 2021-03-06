import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleApp {
  LocaleApp._();

  static final LocaleApp _localeApp = LocaleApp._();

  factory LocaleApp() => _localeApp;

  final ValueNotifier<Locale> locale = ValueNotifier<Locale>(
    AppLocalizations.supportedLocales.contains(Locale(
            Intl.systemLocale.split('_')[0], Intl.systemLocale.split('_')[1]))
        ? Locale(
            Intl.systemLocale.split('_')[0],
            Intl.systemLocale.split('_')[1],
          )
        : const Locale('en', 'Us'),
  );

  void dispose() => locale.dispose();

  void getLocalePreference() => SharedPreferences.getInstance().then(
        (value) {
          String? preference = value.getString('locale');
          if (preference != null) {
            locale.value =
                Locale(preference.split('_')[0], preference.split('_')[1]);
          }
        },
      );
}
