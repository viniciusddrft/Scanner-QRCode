import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/createqrcode/controller/create_qr_code/create_qr_code_controller.dart';
import 'package:scannerqrcode/src/modules/settings/controller/settings_create_qrcode.dart';
import 'package:scannerqrcode/src/shared/admob/controller/admob_controller.dart';
import 'package:scannerqrcode/src/shared/admob/widget/native_ad.dart';
import 'package:scannerqrcode/src/shared/themes/text_themes.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateQRCodeResult extends StatefulWidget {
  final String dataQRCode;

  const CreateQRCodeResult({required this.dataQRCode, Key? key})
      : super(key: key);

  @override
  _CreateQRCodeResultState createState() => _CreateQRCodeResultState();
}

class _CreateQRCodeResultState extends State<CreateQRCodeResult> {
  final ScreenshotController _screenshotController = ScreenshotController();

  void _popupQRCodeSave() {
    Future.delayed(
        const Duration(milliseconds: 500), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title:
            Text(AppLocalizations.of(context)!.createResultQrPopupSave + ' !'),
      ),
    );
  }

  void _popupError() {
    Future.delayed(const Duration(seconds: 1), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
            AppLocalizations.of(context)!.createResultQrPopupError + ' :/'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.createResultQRCodeAppBarTitle),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: _screenshotController,
              child: QrImage(
                padding: EdgeInsets.all(10.sp),
                version: QrVersions.auto,
                data: widget.dataQRCode,
                size: 220.sp,
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
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 50.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: () => CreateQrCodeController.isTheImageQRSaved(
                            _screenshotController)
                        .then(
                      (value) => value ? _popupQRCodeSave() : _popupError(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: 95.w,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .createResultQrCodeButtonSave,
                              style: AppTextThemes.createQrcodeButtons,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.save,
                          size: 24.sp,
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
                    onPressed: () => CreateQrCodeController.shareImageQr(
                        _screenshotController),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: 95.w,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .createResultQrCodeButtonShare,
                              style: AppTextThemes.createQrcodeButtons,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.share,
                          size: 24.sp,
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
      bottomNavigationBar: SizedBox(
        height: 75,
        child: AdmobNativeAd(
          adUnitId: AdmobController.nativeAdUnitIDListTile,
          factoryId: 'listTile',
        ),
      ),
    );
  }
}
