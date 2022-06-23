import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl_standalone.dart';

import '../src/modules/settings/settings_qrcode/controller/settings_create_qrcode.dart';

import 'locale/locale.dart';
import 'routes/routes_app.dart';
import 'theme/theme_app.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SettingsCreateQRCode settingsCreateQRCode = SettingsCreateQRCode();
  final ThemeApp themeApp = ThemeApp();
  final LocaleApp localeApp = LocaleApp();

  @override
  void initState() {
    themeApp.getThemePreference();
    localeApp.getLocalePreference();
    findSystemLocale();
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    settingsCreateQRCode.loadAllPreferences();
    super.initState();
  }

  @override
  void dispose() {
    localeApp.dispose();
    themeApp.dispose();
    settingsCreateQRCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        localeApp.locale,
        themeApp.theme,
      ]),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: localeApp.locale.value,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: themeApp.theme.value,
          primarySwatch: Colors.red,
          appBarTheme: themeApp.isDarkThemeApp
              ? const AppBarTheme(color: Color(0xff202020))
              : const AppBarTheme(color: Color(0xff777777)),
          cardColor: themeApp.isDarkThemeApp ? null : const Color(0xffe7e7ee),
          backgroundColor: themeApp.isDarkThemeApp
              ? const Color(0xff303030)
              : const Color(0xfffbfbfb),
          iconTheme: IconThemeData(
            color: themeApp.isDarkThemeApp ? Colors.white : Colors.black,
          ),
          textTheme: TextTheme(
            labelMedium: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: themeApp.isDarkThemeApp ? Colors.white : Colors.black),
            labelLarge: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: themeApp.isDarkThemeApp ? Colors.white : Colors.black),
            displayMedium: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.red),
            displayLarge: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              color: Colors.red,
              textStyle: const TextStyle(fontSize: 22),
            ),
            bodyMedium: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
          ),
        ),
        initialRoute: '/PageView',
        onGenerateRoute: Routes.routes,
      ),
    );
  }
}
