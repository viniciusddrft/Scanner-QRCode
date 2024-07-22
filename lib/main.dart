import 'package:flutter/material.dart';
import 'core/locale/locale.dart';
import 'core/myapp.dart';
import 'core/theme/theme_app.dart';
import 'src/shared/admob/controller/admob_controller.dart';
import 'src/shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobController.initialize();

  runApp(
    ThemeApp(
      notifier: ThemeAppNotifier(),
      child: LocaleApp(
        notifier: LocaleAppNotifier(),
        child: SettingsQRCodeApp(
          notifier: SettingsQRCodeNotifier(),
          child: const MyApp(),
        ),
      ),
    ),
  );
}
