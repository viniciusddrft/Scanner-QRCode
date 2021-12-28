import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scannerqrcode/core/theme/theme_app.dart';

class AppTextThemes {
  static TextStyle get buttonsSettings => TextStyle(
        fontSize: 18.sp,
        color: ThemeApp.isDarkThemeApp ? Colors.white : Colors.black,
      );

  static TextStyle get titleCardSettings => TextStyle(
        fontSize: 22.sp,
        color: ThemeApp.isDarkThemeApp ? Colors.white : Colors.black,
      );

  static TextStyle get exampleQRCodeSettings => TextStyle(
        fontSize: 18.sp,
        color: ThemeApp.isDarkThemeApp ? Colors.white : Colors.black,
      );

  static TextStyle get titlePopupSettings => TextStyle(
        fontSize: 22.sp,
        color: ThemeApp.isDarkThemeApp ? Colors.white : Colors.black,
      );

  static TextStyle get buttonsPopupSettings => TextStyle(
        fontSize: 16.sp,
        color: ThemeApp.isDarkThemeApp ? Colors.white : Colors.black,
      );

  static TextStyle get nameApp => GoogleFonts.roboto(
        color: Colors.red,
        textStyle: TextStyle(fontSize: 22.sp),
      );
  static TextStyle get readQrcodeButtons => TextStyle(fontSize: 14.sp);
  static TextStyle get readQrcodeResult => TextStyle(fontSize: 20.sp);
  static TextStyle get createQrcodeButtons => TextStyle(fontSize: 14.sp);
}
