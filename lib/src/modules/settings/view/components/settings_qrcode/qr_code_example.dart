import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../controller/settings_create_qrcode.dart';

class QRCodeExample extends StatefulWidget {
  const QRCodeExample({super.key});

  @override
  State<QRCodeExample> createState() => _QRCodeExampleState();
}

class _QRCodeExampleState extends State<QRCodeExample> {
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
        SettingsCreateQRCode.colorQRBackground,
        SettingsCreateQRCode.colorQRCodeEye,
        SettingsCreateQRCode.shapeQRCodeEye,
        SettingsCreateQRCode.colorQRCode,
        SettingsCreateQRCode.shapeQRCode,
        SettingsCreateQRCode.logoPath
      ]),
      builder: (BuildContext context, Widget? child) => QrImage(
        padding: EdgeInsets.all(_size.height * 0.01),
        version: QrVersions.auto,
        data: 'viniciusddtft',
        size: _size.height * 0.2,
        backgroundColor: SettingsCreateQRCode.colorQRBackground.value,
        eyeStyle: QrEyeStyle(
            color: SettingsCreateQRCode.colorQRCodeEye.value,
            eyeShape: SettingsCreateQRCode.shapeQRCodeEye.value),
        dataModuleStyle: QrDataModuleStyle(
            color: SettingsCreateQRCode.colorQRCode.value,
            dataModuleShape: SettingsCreateQRCode.shapeQRCode.value),
        embeddedImage: SettingsCreateQRCode.logoPath.value != null
            ? FileImage(
                File(SettingsCreateQRCode.logoPath.value as String),
              )
            : null,
      ),
    );
  }
}
