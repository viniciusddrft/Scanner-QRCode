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
    findSystemLocale();
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    LocaleAppNotifier.of(context).getLocalePreference();
    ThemeAppNotifier.of(context).getThemePreference();
    SettingsQRCodeNotifier.of(context).loadAllPreferences();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: LocaleAppNotifier.of(context).value,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeAppNotifier.of(context).value,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(color: Color(0xff777777)),
        cardColor: const Color(0xffe7e7ee),
        backgroundColor: const Color(0xfffbfbfb),
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: TextTheme(
          labelMedium: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
          labelLarge: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black),
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
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(color: Color(0xff202020)),
        cardColor: null,
        backgroundColor: const Color(0xff303030),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          labelMedium: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
          labelLarge: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 22, color: Colors.white),
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
    );
  }

  @override
  void dispose() {
    ThemeAppNotifier.of(context).dispose();
    SettingsQRCodeNotifier.of(context).dispose();
    LocaleAppNotifier.of(context).dispose();
    super.dispose();
  }
}
