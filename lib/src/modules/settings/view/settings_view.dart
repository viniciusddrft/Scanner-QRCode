import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scannerqrcode/src/modules/settings/controller/settings_create_qrcode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/settings/view/components/button_contact.dart';
import 'package:scannerqrcode/src/modules/settings/view/components/button_create_qrcode_set_shape.dart';
import 'package:scannerqrcode/src/modules/settings/view/components/button_help.dart';
import 'package:scannerqrcode/src/modules/settings/view/components/button_premium.dart';
import 'package:scannerqrcode/src/modules/settings/view/components/button_rate_app.dart';
import 'package:scannerqrcode/src/modules/settings/view/components/button_set_language.dart';
import 'package:scannerqrcode/src/modules/settings/view/components/button_create_qrcode_set_logo.dart';
import 'package:scannerqrcode/src/modules/settings/view/components/buttons_create_qrcode_set_colors.dart';
import 'package:scannerqrcode/src/modules/settings/view/components/qrcode_settings_exemplo.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatelessWidget {
  final Locale locale;
  const SettingsPage({required this.locale, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: SizedBox(
                height: 650.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 35.h, top: 15.h),
                      child: Text(
                        'settingsTitleCardCreateQrCode'.tr(),
                        style: TextStyle(fontSize: 22.sp),
                      ),
                    ),
                    ButtonCreateQRCodeSetColor(
                      colorChange: SettingsCreateQRCode.colorQRBackground,
                      textButton: 'settingsButtonColorbackground'.tr(),
                      savePreferenceKey: 'colorQRBackground',
                    ),
                    ButtonCreateQRCodeSetColor(
                      colorChange: SettingsCreateQRCode.colorQRCode,
                      textButton: 'settingsButtonColorCode'.tr(),
                      savePreferenceKey: 'colorQRCode',
                    ),
                    ButtonCreateQRCodeSetColor(
                      colorChange: SettingsCreateQRCode.colorQRCodeEye,
                      textButton: 'settingsButtonColorEye'.tr(),
                      savePreferenceKey: 'colorQRCodeEye',
                    ),
                    ButtonCreateQRCodeSetShape.body(
                      bodyShape: SettingsCreateQRCode.shapeQRCode,
                      colorBodyShape: SettingsCreateQRCode.colorQRCode,
                    ),
                    ButtonCreateQRCodeSetShape.eye(
                      eyeShape: SettingsCreateQRCode.shapeQRCodeEye,
                      colorEyeShape: SettingsCreateQRCode.colorQRCodeEye,
                    ),
                    const ButtonCreateQRCodeSetLogo(),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        'settingsQRCodeExample'.tr(),
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: const QRCodeExemploSettings(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  height: 180.h,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, bottom: 40.h),
                        child: Text(
                          'settingsLanguageTitle'.tr(),
                          style: TextStyle(fontSize: 22.sp),
                        ),
                      ),
                      ButtonSetLanguage(locale: locale)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  height: 180.h,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, bottom: 40.h),
                        child: Text(
                          'settingsQRCodePremiumVersion'.tr(),
                          style: TextStyle(fontSize: 22.sp),
                        ),
                      ),
                      const ButtonPremium()
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  height: 180.h,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, bottom: 40.h),
                        child: Text(
                          'settingsHelp'.tr(),
                          style: TextStyle(fontSize: 22.sp),
                        ),
                      ),
                      const ButtonHelp()
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  height: 180.h,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, bottom: 40.h),
                        child: Text(
                          'settingsAboutTheApp'.tr(),
                          style: TextStyle(fontSize: 22.sp),
                        ),
                      ),
                      ButtonRateApp()
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  height: 180.h,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, bottom: 40.h),
                        child: Text(
                          'settingsContact'.tr(),
                          style: TextStyle(fontSize: 22.sp),
                        ),
                      ),
                      const ButtonContact()
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.h, top: 30.h),
              child: Text(
                'settingsVersion'.tr() + ' 2.0.2',
                style: GoogleFonts.yatraOne(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
