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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
                        AppLocalizations.of(context)!
                            .settingsTitleCardCreateQrCode,
                        style: TextStyle(fontSize: 22.sp),
                      ),
                    ),
                    ButtonCreateQRCodeSetColor(
                      colorChange: SettingsCreateQRCode.colorQRBackground,
                      textButton: AppLocalizations.of(context)!
                          .settingsButtonColorbackground,
                      savePreferenceKey: 'colorQRBackground',
                    ),
                    ButtonCreateQRCodeSetColor(
                      colorChange: SettingsCreateQRCode.colorQRCode,
                      textButton:
                          AppLocalizations.of(context)!.settingsButtonColorCode,
                      savePreferenceKey: 'colorQRCode',
                    ),
                    ButtonCreateQRCodeSetColor(
                      colorChange: SettingsCreateQRCode.colorQRCodeEye,
                      textButton:
                          AppLocalizations.of(context)!.settingsButtonColorEye,
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
                        AppLocalizations.of(context)!.settingsQRCodeExample,
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
                          AppLocalizations.of(context)!.settingsLanguageTitle,
                          style: TextStyle(fontSize: 22.sp),
                        ),
                      ),
                      const ButtonSetLanguage()
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
                          AppLocalizations.of(context)!
                              .settingsQRCodePremiumVersion,
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
                          AppLocalizations.of(context)!.settingsHelp,
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
                          AppLocalizations.of(context)!.settingsAboutTheApp,
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
                          AppLocalizations.of(context)!.settingsContact,
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
                AppLocalizations.of(context)!.settingsVersion + ' 2.0.3',
                style: GoogleFonts.yatraOne(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
