import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/shared/services/interface/local_storage_interface.dart';
import 'package:scannerqrcode/src/shared/services/local_storage_shared_preferrence.dart';

import 'core/locale/locale.dart';
import 'core/myapp.dart';
import 'core/theme/theme_app.dart';
import 'src/shared/admob/controller/admob_controller.dart';
import 'src/shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobController.initialize();

  final ILocalStorage localStorage = LocalStorageSharedPreferrence();

  runApp(
    ThemeApp(
      notifier: ThemeAppNotifier(
        localStorage: localStorage,
      ),
      child: LocaleApp(
        notifier: LocaleAppNotifier(
          localStorage: localStorage,
        ),
        child: SettingsQRCodeApp(
          notifier: SettingsQRCodeNotifier(
            localStorage: localStorage,
          ),
          child: const MyApp(),
        ),
      ),
    ),
  );
}
