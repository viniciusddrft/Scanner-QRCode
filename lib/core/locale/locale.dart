import 'package:flutter/material.dart';

import 'package:scannerqrcode/src/shared/services/interface/local_storage_interface.dart';

class LocaleAppNotifier extends ValueNotifier<Locale> {
  final ILocalStorage localStorage;

  LocaleAppNotifier({required this.localStorage})
      : super(const Locale('en', 'Us'));

  static LocaleAppNotifier of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LocaleApp>()!.notifier!;

  void getLocale() async {
    final String? preference = await localStorage.getValue<String>('locale');
    if (preference != null) {
      value = Locale(preference.split('_')[0], preference.split('_')[1]);
    }
  }

  void saveLocale(Locale newLocale) {
    value = newLocale;
    localStorage.saveValue<String>('locale', newLocale.toString());
  }
}

class LocaleApp extends InheritedNotifier<LocaleAppNotifier> {
  const LocaleApp({super.key, required super.child, super.notifier});
}
