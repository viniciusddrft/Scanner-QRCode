import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:scannerqrcode/src/shared/services/interface/local_storage_interface.dart';
import 'package:scannerqrcode/src/shared/services/local_storage_shared_preferrence.dart';

class SettingsQRCodeNotifier extends ChangeNotifier {
  final ILocalStorage _localStorage = LocalStorageSharedPreferrence();

  SettingsQRCodeNotifier();

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
    _localStorage.saveValue<int>(savePreferenceKey, color.value);
    if (savePreferenceKey == 'colorQRBackground') {
      colorQRBackground = color;
    } else if (savePreferenceKey == 'colorQRCode') {
      colorQRCode = color;
    } else {
      colorQRCodeEye = color;
    }
    notifyListeners();
  }

  void changeShape(String savePreferenceKey, int value) {
    _localStorage.saveValue<int>(savePreferenceKey, value);
    if (savePreferenceKey == 'shapeQRCodeEye') {
      shapeQRCodeEye = value == 0 ? QrEyeShape.square : QrEyeShape.circle;
    } else {
      shapeQRCode =
          value == 0 ? QrDataModuleShape.square : QrDataModuleShape.circle;
    }
    notifyListeners();
  }

  void changeLogo(String newlogoPath) {
    _localStorage.saveValue<String>('logo', newlogoPath);
    logoPath = newlogoPath;
    notifyListeners();
  }

  void removeLogo() {
    logoPath = null;
    _localStorage.remove('logo');
    notifyListeners();
  }

  void _getPreferenceShape() async {
    if (await _localStorage.getValue<int>('shapeQRCode') == 0) {
      shapeQRCode = QrDataModuleShape.square;
    } else {
      shapeQRCode = QrDataModuleShape.circle;
    }
    if (await _localStorage.getValue<int>('shapeQRCodeEye') == 0) {
      shapeQRCodeEye = QrEyeShape.square;
    } else {
      shapeQRCodeEye = QrEyeShape.circle;
    }
  }

  void _getPreferencesColors() async {
    final int? colorQRBackgroundRaw =
        await _localStorage.getValue<int>('colorQRBackground');
    final int? colorQRCodeRaw =
        await _localStorage.getValue<int>('colorQRCode');
    final int? colorQRCodeEyeRaw =
        await _localStorage.getValue<int>('colorQRCodeEye');
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
    logoPath = await _localStorage.getValue<String>('logo');
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
