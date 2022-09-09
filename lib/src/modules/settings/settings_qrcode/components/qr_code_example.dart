import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../../../shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

class QRCodeExample extends StatefulWidget {
  const QRCodeExample({super.key});

  @override
  State<QRCodeExample> createState() => _QRCodeExampleState();
}

class _QRCodeExampleState extends State<QRCodeExample> {
  late final Size _size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        SettingsCreateQRCodeController.colorQRBackground,
        SettingsCreateQRCodeController.colorQRCodeEye,
        SettingsCreateQRCodeController.shapeQRCodeEye,
        SettingsCreateQRCodeController.colorQRCode,
        SettingsCreateQRCodeController.shapeQRCode,
        SettingsCreateQRCodeController.logoPath
      ]),
      builder: (BuildContext context, Widget? child) => QrImage(
        padding: EdgeInsets.all(_size.height * 0.01),
        version: QrVersions.auto,
        data: 'viniciusddtft',
        size: _size.height * 0.2,
        backgroundColor: SettingsCreateQRCodeController.colorQRBackground.value,
        eyeStyle: QrEyeStyle(
            color: SettingsCreateQRCodeController.colorQRCodeEye.value,
            eyeShape: SettingsCreateQRCodeController.shapeQRCodeEye.value),
        dataModuleStyle: QrDataModuleStyle(
            color: SettingsCreateQRCodeController.colorQRCode.value,
            dataModuleShape: SettingsCreateQRCodeController.shapeQRCode.value),
        embeddedImage: SettingsCreateQRCodeController.logoPath.value != null
            ? FileImage(
                File(SettingsCreateQRCodeController.logoPath.value as String),
              )
            : null,
      ),
    );
  }
}
