import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl_standalone.dart';

import '../src/shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

import 'locale/locale.dart';
import 'routes/routes_app.dart';
import 'theme/theme_app.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ThemeApp.getThemePreference();
    LocaleApp.getLocalePreference();
    findSystemLocale();
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SettingsCreateQRCodeController.loadAllPreferences();
    super.initState();
  }

  @override
  void dispose() {
    LocaleApp.dispose();
    ThemeApp.dispose();
    SettingsCreateQRCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        LocaleApp.locale,
        ThemeApp.theme,
      ]),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: LocaleApp.locale.value,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: ThemeApp.theme.value,
          primarySwatch: Colors.red,
          appBarTheme: ThemeApp.isDarkThemeApp
              ? const AppBarTheme(color: Color(0xff202020))
              : const AppBarTheme(color: Color(0xff777777)),
          cardColor: ThemeApp.isDarkThemeApp ? null : const Color(0xffe7e7ee),
          backgroundColor: ThemeApp.isDarkThemeApp
              ? const Color(0xff303030)
              : const Color(0xfffbfbfb),
          iconTheme: IconThemeData(
            color: ThemeApp.isDarkThemeApp ? Colors.white : Colors.black,
          ),
          textTheme: TextTheme(
            labelMedium: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ThemeApp.isDarkThemeApp ? Colors.white : Colors.black),
            labelLarge: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: ThemeApp.isDarkThemeApp ? Colors.white : Colors.black),
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
