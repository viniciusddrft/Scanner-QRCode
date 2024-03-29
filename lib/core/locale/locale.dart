import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/src/shared/services/local_storage_shared_preferrence.dart';

import '../../src/shared/services/interface/local_storage_interface.dart';

class LocaleAppNotifier extends ValueNotifier<Locale> {
  final ILocalStorage _localStorage = LocalStorageSharedPreferrence();

  LocaleAppNotifier() : super(const Locale('en', 'Us'));

  static LocaleAppNotifier of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LocaleApp>()!.notifier!;

  void getLocalePreference() async {
    final String? preference = await _localStorage.getValue<String>('locale');
    if (preference != null) {
      value = Locale(preference.split('_')[0], preference.split('_')[1]);
    } else {
      value = AppLocalizations.supportedLocales.contains(Locale(
              Intl.systemLocale.split('_')[0], Intl.systemLocale.split('_')[1]))
          ? Locale(
              Intl.systemLocale.split('_')[0],
              Intl.systemLocale.split('_')[1],
            )
          : const Locale('en', 'Us');
    }
  }

  void changeLocale(Locale newLocale) {
    value = newLocale;
    _localStorage.saveValue<String>('locale', newLocale.toString());
  }
}

class LocaleApp extends InheritedNotifier<LocaleAppNotifier> {
  const LocaleApp({super.key, required super.child, super.notifier});
}
