import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/shared/services/local_storage_shared_preferrence.dart';
import '../../src/shared/services/interface/local_storage_interface.dart';

class ThemeAppNotifier extends ValueNotifier<ThemeMode> {
  final ILocalStorage _localStorage = LocalStorageSharedPreferrence();

  ThemeAppNotifier() : super(ThemeMode.system);

  static ThemeAppNotifier of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeApp>()!.notifier!;

  void changeTheme(ThemeMode newThemeMode) {
    value = newThemeMode;
    if (newThemeMode == ThemeMode.dark) {
      _localStorage.saveValue<String>('theme', 'dark');
    } else if (newThemeMode == ThemeMode.light) {
      _localStorage.saveValue<String>('theme', 'light');
    } else {
      _localStorage.saveValue<String>('theme', 'system');
    }
  }

  void getThemePreference() {
    _localStorage.getValue<String>('theme').then((String? preference) {
      if (preference != null) {
        if (preference == 'dark') {
          value = ThemeMode.dark;
        } else if (preference == 'light') {
          value = ThemeMode.light;
        } else {
          value = ThemeMode.system;
        }
      }
    });
  }
}

class ThemeApp extends InheritedNotifier<ThemeAppNotifier> {
  const ThemeApp({super.key, required super.child, super.notifier});
}
