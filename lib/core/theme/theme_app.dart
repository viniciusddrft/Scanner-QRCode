import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/shared/services/interface/local_storage_interface.dart';

class ThemeAppNotifier extends ValueNotifier<ThemeMode> {
  final ILocalStorage localStorage;

  ThemeAppNotifier({required this.localStorage}) : super(ThemeMode.dark);

  static ThemeAppNotifier of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeAppA>()!.notifier!;

  void changeTheme(ThemeMode newThemeMode) {
    value = newThemeMode;
    if (newThemeMode == ThemeMode.dark) {
      localStorage.saveValue<String>('theme', 'dark');
    } else if (newThemeMode == ThemeMode.light) {
      localStorage.saveValue<String>('theme', 'light');
    } else {
      localStorage.saveValue<String>('theme', 'system');
    }
  }

  void getThemePreference() {
    localStorage.getValue<String>('theme').then((String? preference) {
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

class ThemeAppA extends InheritedNotifier<ThemeAppNotifier> {
  const ThemeAppA({super.key, required super.child, super.notifier});
}
