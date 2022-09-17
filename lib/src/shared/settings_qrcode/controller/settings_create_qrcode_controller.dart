import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:scannerqrcode/src/shared/services/interface/local_storage_interface.dart';

class SettingsQRCodeNotifier extends ChangeNotifier {
  final ILocalStorage localStorage;

  SettingsQRCodeNotifier({required this.localStorage});

  static SettingsQRCodeNotifier of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<SettingsQRCodeApp>()!
      .notifier!;

  Color colorQRCodeEye = Colors.black;

  Color colorQRBackground = Colors.white;

  Color colorQRCode = Colors.black;

  QrEyeShape shapeQRCodeEye = QrEyeShape.square;

  QrDataModuleShape shapeQRCode = QrDataModuleShape.square;

  String? logoPath;

  void changeColor(String savePreferenceKey, Color color) {
    localStorage.saveValue<int>(savePreferenceKey, color.value);
    notifyListeners();
  }

  void changeShape(String savePreferenceKey, int value) {
    localStorage.saveValue<int>(savePreferenceKey, value);
    notifyListeners();
  }

  void changeLogo(String logoPath) {
    localStorage.saveValue<String>('logo', logoPath);
    notifyListeners();
  }

  void removeLogo() {
    logoPath = null;
    localStorage.remove('logo');
    notifyListeners();
  }

  void _getPreferenceShape() async {
    if (await localStorage.getValue<int>('shapeQRCode') == 0) {
      shapeQRCode = QrDataModuleShape.square;
    } else {
      shapeQRCode = QrDataModuleShape.circle;
    }
    if (await localStorage.getValue<int>('shapeQRCodeEye') == 0) {
      shapeQRCodeEye = QrEyeShape.square;
    } else {
      shapeQRCodeEye = QrEyeShape.circle;
    }
  }

  void _getPreferencesColors() async {
    final int? colorQRBackgroundRaw =
        await localStorage.getValue<int>('colorQRBackground');
    final int? colorQRCodeRaw = await localStorage.getValue<int>('colorQRCode');
    final int? colorQRCodeEyeRaw =
        await localStorage.getValue<int>('colorQRCodeEye');
    if (colorQRBackgroundRaw != null) {
      colorQRBackground = Color(colorQRBackgroundRaw);
    }
    if (colorQRCodeRaw != null) {
      colorQRCode = Color(colorQRCodeRaw);
    }
    if (colorQRCodeEyeRaw != null) {
      colorQRCodeEye = Color(colorQRCodeEyeRaw);
    }
  }

  void _getPreferencesLogo() async {
    logoPath = await localStorage.getValue<String>('logo');
  }

  void loadAllPreferences() {
    _getPreferencesColors();
    _getPreferenceShape();
    _getPreferencesLogo();
  }
}

class SettingsQRCodeApp extends InheritedNotifier<SettingsQRCodeNotifier> {
  const SettingsQRCodeApp({super.key, required super.child, super.notifier});
}
