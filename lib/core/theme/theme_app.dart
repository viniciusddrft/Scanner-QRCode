import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeApp {
  static final ValueNotifier<Brightness> theme =
      ValueNotifier<Brightness>(themeSystem);

  static bool get isDarkThemeApp => theme.value == Brightness.dark;

  static void changeTheme(Brightness newTheme) => theme.value = newTheme;

  static Brightness get themeSystem =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  static bool get isDarkThemeSystem =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
      Brightness.dark;

  static void getThemePreference() => SharedPreferences.getInstance().then(
        (value) {
          String? preference = value.getString('theme');
          if (preference != null) {
            if (preference == 'system') {
              ThemeApp.theme.value = ThemeApp.themeSystem;
            } else if (preference == 'dark') {
              ThemeApp.theme.value = Brightness.dark;
            } else if (preference == 'light') {
              ThemeApp.theme.value = Brightness.light;
            }
          }
        },
      );

  static Future<String?> getThemeSaved() =>
      SharedPreferences.getInstance().then(
        (value) {
          String? preference = value.getString('theme');
          if (preference != null) {
            return preference;
          } else {
            return null;
          }
        },
      );
}
