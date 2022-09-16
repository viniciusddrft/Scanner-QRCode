import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/shared/services/local_storage_shared_preferrence.dart';

import 'core/locale/locale.dart';
import 'core/myapp.dart';
import 'src/shared/admob/controller/admob_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobController.initialize();

  runApp(
    LocaleApp(
      notifier:
          LocaleAppNotifier(localStorage: LocalStorageSharedPreferrence()),
      child: const MyApp(),
    ),
  );
}
