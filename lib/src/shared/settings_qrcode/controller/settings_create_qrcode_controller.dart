import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCreateQRCodeController {
  static final ValueNotifier<Color> colorQRCodeEye =
      ValueNotifier<Color>(Colors.black);

  static final ValueNotifier<Color> colorQRBackground =
      ValueNotifier<Color>(Colors.white);

  static final ValueNotifier<Color> colorQRCode =
      ValueNotifier<Color>(Colors.black);

  static final ValueNotifier<QrEyeShape> shapeQRCodeEye =
      ValueNotifier<QrEyeShape>(QrEyeShape.square);

  static final ValueNotifier<QrDataModuleShape> shapeQRCode =
      ValueNotifier<QrDataModuleShape>(QrDataModuleShape.square);

  static final ValueNotifier<String?> logoPath = ValueNotifier<String?>(null);

  static void getPreferenceShape() => SharedPreferences.getInstance().then(
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

  static void getPreferencesColors() => SharedPreferences.getInstance().then(
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

  static void getPreferencesLogo() => SharedPreferences.getInstance().then(
        (preference) {
          final String? response = preference.getString('logo');
          if (response != null) logoPath.value = response;
        },
      );

  static void loadAllPreferences() {
    getPreferencesColors();
    getPreferenceShape();
    getPreferencesLogo();
  }

  static void dispose() {
    colorQRCodeEye.dispose();
    colorQRBackground.dispose();
    colorQRCodeEye.dispose();
    shapeQRCodeEye.dispose();
    shapeQRCode.dispose();
    logoPath.dispose();
  }
}
