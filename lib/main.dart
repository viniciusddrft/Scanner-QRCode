import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/shared/services/local_storage_shared_preferrence.dart';

import 'core/locale/locale.dart';
import 'core/myapp.dart';
import 'src/shared/admob/controller/admob_controller.dart';
import 'src/shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobController.initialize();

  runApp(
    LocaleApp(
      notifier: LocaleAppNotifier(
        localStorage: LocalStorageSharedPreferrence(),
      ),
      child: SettingsQRCodeApp(
        notifier: SettingsQRCodeNotifier(
            localStorage: LocalStorageSharedPreferrence()),
        child: const MyApp(),
      ),
    ),
  );
}
