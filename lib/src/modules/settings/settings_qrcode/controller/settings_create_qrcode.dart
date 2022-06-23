import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCreateQRCode {
  SettingsCreateQRCode._();

  static final SettingsCreateQRCode _settingsCreateQRCode =
      SettingsCreateQRCode._();

  factory SettingsCreateQRCode() => _settingsCreateQRCode;

  final ValueNotifier<Color> colorQRCodeEye =
      ValueNotifier<Color>(Colors.black);

  final ValueNotifier<Color> colorQRBackground =
      ValueNotifier<Color>(Colors.white);

  final ValueNotifier<Color> colorQRCode = ValueNotifier<Color>(Colors.black);

  final ValueNotifier<QrEyeShape> shapeQRCodeEye =
      ValueNotifier<QrEyeShape>(QrEyeShape.square);

  final ValueNotifier<QrDataModuleShape> shapeQRCode =
      ValueNotifier<QrDataModuleShape>(QrDataModuleShape.square);

  final ValueNotifier<String?> logoPath = ValueNotifier<String?>(null);

  void getPreferenceShape() => SharedPreferences.getInstance().then(
        (preference) {
          final int? responseQRCode = preference.getInt('shapeQRCode');
          if (responseQRCode == 0) {
            shapeQRCode.value = QrDataModuleShape.square;
          } else if (responseQRCode == 1) {
            shapeQRCode.value = QrDataModuleShape.circle;
          }
          final int? responseQRCodeEye = preference.getInt('shapeQRCodeEye');
          if (responseQRCodeEye == 0) {
            shapeQRCodeEye.value = QrEyeShape.square;
          } else if (responseQRCodeEye == 1) {
            shapeQRCodeEye.value = QrEyeShape.circle;
          }
        },
      );

  void getPreferencesColors() => SharedPreferences.getInstance().then(
        (preference) {
          final int? responseBackground =
              preference.getInt('colorQRBackground');
          if (responseBackground != null) {
            colorQRBackground.value = Color(responseBackground);
          }
          final int? responseQRCode = preference.getInt('colorQRCode');
          if (responseQRCode != null) {
            colorQRCode.value = Color(responseQRCode);
          }
          final int? responseQRCodeEye = preference.getInt('colorQRCodeEye');
          if (responseQRCodeEye != null) {
            colorQRCodeEye.value = Color(responseQRCodeEye);
          }
        },
      );

  void getPreferencesLogo() => SharedPreferences.getInstance().then(
        (preference) {
          final String? response = preference.getString('logo');
          if (response != null) logoPath.value = response;
        },
      );

  void loadAllPreferences() {
    getPreferencesColors();
    getPreferenceShape();
    getPreferencesLogo();
  }

  void dispose() {
    colorQRCodeEye.dispose();
    colorQRBackground.dispose();
    colorQRCodeEye.dispose();
    shapeQRCodeEye.dispose();
    shapeQRCode.dispose();
    logoPath.dispose();
  }
}
