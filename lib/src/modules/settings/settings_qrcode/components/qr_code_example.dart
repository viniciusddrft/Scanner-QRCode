import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../controller/settings_create_qrcode.dart';

class QRCodeExample extends StatefulWidget {
  const QRCodeExample({super.key});

  @override
  State<QRCodeExample> createState() => _QRCodeExampleState();
}

class _QRCodeExampleState extends State<QRCodeExample> {
  final SettingsCreateQRCode settingsCreateQRCode = SettingsCreateQRCode();
  late final Size _size;

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        settingsCreateQRCode.colorQRBackground,
        settingsCreateQRCode.colorQRCodeEye,
        settingsCreateQRCode.shapeQRCodeEye,
        settingsCreateQRCode.colorQRCode,
        settingsCreateQRCode.shapeQRCode,
        settingsCreateQRCode.logoPath
      ]),
      builder: (BuildContext context, Widget? child) => QrImage(
        padding: EdgeInsets.all(_size.height * 0.01),
        version: QrVersions.auto,
        data: 'viniciusddtft',
        size: _size.height * 0.2,
        backgroundColor: settingsCreateQRCode.colorQRBackground.value,
        eyeStyle: QrEyeStyle(
            color: settingsCreateQRCode.colorQRCodeEye.value,
            eyeShape: settingsCreateQRCode.shapeQRCodeEye.value),
        dataModuleStyle: QrDataModuleStyle(
            color: settingsCreateQRCode.colorQRCode.value,
            dataModuleShape: settingsCreateQRCode.shapeQRCode.value),
        embeddedImage: settingsCreateQRCode.logoPath.value != null
            ? FileImage(
                File(settingsCreateQRCode.logoPath.value as String),
              )
            : null,
      ),
    );
  }
}
