import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeApp {
  static final ValueNotifier<Brightness> theme =
      ValueNotifier<Brightness>(themeSystem);

  static bool get isDarkThemeApp => theme.value == Brightness.dark;

  static Brightness get themeSystem =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  static bool get isDarkThemeSystem =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
      Brightness.dark;

  static void changeTheme(Brightness newTheme) => theme.value = newTheme;

  static void dispose() => theme.dispose();

  static void getThemePreference() => SharedPreferences.getInstance().then(
        (value) {
          final String? preference = value.getString('theme');
          if (preference != null) {
            if (preference == 'system') {
              theme.value = themeSystem;
            } else if (preference == 'dark') {
              theme.value = Brightness.dark;
            } else if (preference == 'light') {
              theme.value = Brightness.light;
            }
          }
        },
      );

  static Future<String?> getThemeSaved() =>
      SharedPreferences.getInstance().then(
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
