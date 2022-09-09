import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

import '../../../shared/admob/controller/admob_controller.dart';
import '../../../shared/admob/widget/native_ad.dart';
import '../../../shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';
import '../create_qr_code/controller/create_qr_code_controller.dart';

class CreateQRCodeResult extends StatefulWidget {
  final String dataQRCode;

  const CreateQRCodeResult({required this.dataQRCode, super.key});

  @override
  State<CreateQRCodeResult> createState() => _CreateQRCodeResultState();
}

class _CreateQRCodeResultState extends State<CreateQRCodeResult> {
  final ScreenshotController screenshotController = ScreenshotController();
  late final CreateQrCodeController _createQrCodeController;

  @override
  void initState() {
    _createQrCodeController = CreateQrCodeController(
      context,
      screenshotController: screenshotController,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.createResultQRCodeAppBarTitle),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: screenshotController,
              child: QrImage(
                padding: EdgeInsets.all(
                  size.height * 0.013,
                ),
                version: QrVersions.auto,
                data: widget.dataQRCode,
                size: size.height * 0.25,
                backgroundColor:
                    SettingsCreateQRCodeController.colorQRBackground.value,
                eyeStyle: QrEyeStyle(
                    color: SettingsCreateQRCodeController.colorQRCodeEye.value,
                    eyeShape:
                        SettingsCreateQRCodeController.shapeQRCodeEye.value),
                dataModuleStyle: QrDataModuleStyle(
                    color: SettingsCreateQRCodeController.colorQRCode.value,
                    dataModuleShape:
                        SettingsCreateQRCodeController.shapeQRCode.value),
                embeddedImage:
                    SettingsCreateQRCodeController.logoPath.value != null
                        ? FileImage(
                            File(SettingsCreateQRCodeController.logoPath.value
                                as String),
                          )
                        : null,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.09,
                right: size.width * 0.09,
                top: size.height * 0.07,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: _createQrCodeController.saveImageQR,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: size.height * 0.045,
                          width: size.width * 0.25,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .createResultQrCodeButtonSave,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.save,
                          size: 24,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: _createQrCodeController.shareImageQr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: size.height * 0.045,
                          width: size.width * 0.25,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .createResultQrCodeButtonShare,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.share,
                          size: 24,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 75,
        child: AdmobNativeAd(
          adUnitId: AdmobController.nativeAdUnitIDListTile,
          factoryId: 'listTile',
        ),
      ),
    );
  }
}
