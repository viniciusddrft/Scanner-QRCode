import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeApp {
  ThemeApp._();

  static final ThemeApp _themeApp = ThemeApp._();

  factory ThemeApp() => _themeApp;

  final ValueNotifier<Brightness> theme =
      ValueNotifier<Brightness>(themeSystem);

  bool get isDarkThemeApp => theme.value == Brightness.dark;

  static Brightness get themeSystem =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  static bool get isDarkThemeSystem =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
      Brightness.dark;

  void changeTheme(Brightness newTheme) => theme.value = newTheme;

  void dispose() => theme.dispose();

  void getThemePreference() => SharedPreferences.getInstance().then(
        (value) {
          final String? preference = value.getString('theme');
          if (preference != null) {
            if (preference == 'system') {
              _themeApp.theme.value = themeSystem;
            } else if (preference == 'dark') {
              _themeApp.theme.value = Brightness.dark;
            } else if (preference == 'light') {
              _themeApp.theme.value = Brightness.light;
            }
          }
        },
      );

  Future<String?> getThemeSaved() => SharedPreferences.getInstance().then(
        (value) {
          final String? preference = value.getString('theme');
          if (preference != null) {
            return preference;
          } else {
            return null;
          }
        },
      );
}
