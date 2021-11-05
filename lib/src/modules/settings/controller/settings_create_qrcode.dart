import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCreateQRCode {
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

  static void getPreferenceShape() {
    SharedPreferences.getInstance().then((preference) {
      int? response = preference.getInt('shapeQRCodeEye');
      if (response == 0) {
        shapeQRCodeEye.value = QrEyeShape.square;
      } else if (response == 1) {
        shapeQRCodeEye.value = QrEyeShape.circle;
      }
    });

    SharedPreferences.getInstance().then((preference) {
      int? response = preference.getInt('shapeQRCode');
      if (response == 0) {
        shapeQRCode.value = QrDataModuleShape.square;
      } else if (response == 1) {
        shapeQRCode.value = QrDataModuleShape.circle;
      }
    });
  }

  static void getPreferencesColors() {
    SharedPreferences.getInstance().then((preference) {
      int? response = preference.getInt('colorQRCodeEye');
      if (response != null) colorQRCodeEye.value = Color(response);
    });

    SharedPreferences.getInstance().then((preference) {
      int? response = preference.getInt('colorQRBackground');
      if (response != null) colorQRBackground.value = Color(response);
    });

    SharedPreferences.getInstance().then((preference) {
      int? response = preference.getInt('colorQRCode');
      if (response != null) colorQRCode.value = Color(response);
    });
  }

  static getPreferencesLogo() {
    SharedPreferences.getInstance().then((preference) {
      String? response = preference.getString('logo');
      if (response != null) logoPath.value = response;
    });
  }
}
