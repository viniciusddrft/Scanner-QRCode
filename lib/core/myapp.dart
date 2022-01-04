import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl_standalone.dart';
import 'package:scannerqrcode/core/locale/locale.dart';
import 'package:scannerqrcode/core/routes/routes_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/core/theme/theme_app.dart';
import 'package:scannerqrcode/src/modules/settings/controller/settings_create_qrcode.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
    SettingsCreateQRCode.getPreferencesColors();
    SettingsCreateQRCode.getPreferenceShape();
    SettingsCreateQRCode.getPreferencesLogo();
    super.initState();
  }

  @override
  void dispose() {
    LocaleApp.localeApp.dispose();
    ThemeApp.theme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 820.6),
      builder: () => AnimatedBuilder(
        animation: Listenable.merge([
          LocaleApp.localeApp,
          ThemeApp.theme,
        ]),
        builder: (BuildContext context, Widget? child) => MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: LocaleApp.localeApp.value,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: ThemeApp.theme.value,
            primarySwatch: Colors.red,
            appBarTheme: ThemeApp.isDarkThemeApp
                ? const AppBarTheme(color: Color(0xff202020))
                : const AppBarTheme(color: Color(0xff777777)),
            cardColor: ThemeApp.isDarkThemeApp ? null : const Color(0xffe7e7ee),
          ),
          initialRoute: '/Home',
          onGenerateRoute: Routes.routes,
        ),
      ),
    );
  }
}
