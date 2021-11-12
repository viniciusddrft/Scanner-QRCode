import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scannerqrcode/src/modules/settings/controller/settings_create_qrcode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QRCodeExemploSettings extends StatefulWidget {
  const QRCodeExemploSettings({Key? key}) : super(key: key);

  @override
  _QRCodeExemploSettingsState createState() => _QRCodeExemploSettingsState();
}

class _QRCodeExemploSettingsState extends State<QRCodeExemploSettings> {
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
        padding: EdgeInsets.all(10.sp),
        version: QrVersions.auto,
        data: 'viniciusddtft',
        size: 100.sp,
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
