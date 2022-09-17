import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../../../shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

class QRCodeExample extends StatelessWidget {
  const QRCodeExample({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return QrImage(
      padding: EdgeInsets.all(size.height * 0.01),
      version: QrVersions.auto,
      data: 'viniciusddtft',
      size: size.height * 0.2,
      backgroundColor: SettingsQRCodeNotifier.of(context).colorQRBackground,
      eyeStyle: QrEyeStyle(
          color: SettingsQRCodeNotifier.of(context).colorQRCodeEye,
          eyeShape: SettingsQRCodeNotifier.of(context).shapeQRCodeEye),
      dataModuleStyle: QrDataModuleStyle(
          color: SettingsQRCodeNotifier.of(context).colorQRCode,
          dataModuleShape: SettingsQRCodeNotifier.of(context).shapeQRCode),
      embeddedImage: SettingsQRCodeNotifier.of(context).logoPath != null
          ? FileImage(
              File(SettingsQRCodeNotifier.of(context).logoPath as String),
            )
          : null,
    );
  }
}
