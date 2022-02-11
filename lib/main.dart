import 'package:flutter/material.dart';
import 'package:scannerqrcode/core/myapp.dart';
import 'package:scannerqrcode/src/shared/admob/controller/admob_controller.dart';

void main() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    AdmobController.initialize();
  } catch (error, stackTrace) {
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
  }

  runApp(const MyApp());
}
