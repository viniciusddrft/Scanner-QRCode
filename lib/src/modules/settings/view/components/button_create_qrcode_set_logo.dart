import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scannerqrcode/src/modules/settings/controller/settings_create_qrcode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonCreateQRCodeSetLogo extends StatefulWidget {
  const ButtonCreateQRCodeSetLogo({Key? key}) : super(key: key);

  @override
  State<ButtonCreateQRCodeSetLogo> createState() =>
      _ButtonCreateQRCodeSetLogoState();
}

class _ButtonCreateQRCodeSetLogoState extends State<ButtonCreateQRCodeSetLogo> {
  void _popupSetLogo() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width / 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                tooltip: 'settingsImageTooltipAdd'.tr(),
                onPressed: () async => _setLogo().then(
                  (_) => Navigator.pop(context),
                ),
                icon: Icon(
                  Icons.add_photo_alternate,
                  size: 30.sp,
                ),
              ),
              IconButton(
                tooltip: 'settingsImageTooltipRemove'.tr(),
                onPressed: () {
                  SettingsCreateQRCode.logoPath.value = null;
                  SharedPreferences.getInstance().then(
                    (SharedPreferences preference) => preference.remove('logo'),
                  );
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.delete,
                  size: 30.sp,
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('settingsPopupButtonCancel'.tr()),
          )
        ],
      ),
    );
  }

  Future<void> _setLogo() async =>
      ImagePicker().pickImage(source: ImageSource.gallery).then(
        (XFile? value) {
          if (value != null) {
            SettingsCreateQRCode.logoPath.value = value.path;
            SharedPreferences.getInstance().then(
              (SharedPreferences preference) =>
                  preference.setString('logo', value.path),
            );
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
      child: SizedBox(
        height: 45.h,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: BorderSide(color: Colors.black, width: 2.w)),
          onPressed: _popupSetLogo,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text('settingsImage'.tr(),
                      style: TextStyle(fontSize: 18.sp)),
                ),
                ValueListenableBuilder(
                  valueListenable: SettingsCreateQRCode.logoPath,
                  builder: (BuildContext context, value, Widget? child) =>
                      SettingsCreateQRCode.logoPath.value != null
                          ? Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: SizedBox(
                                height: 25.sp,
                                width: 25.sp,
                                child: Image.file(
                                  File(SettingsCreateQRCode.logoPath.value
                                      as String),
                                ),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: SizedBox(
                                height: 25.sp,
                                width: 25.sp,
                                child: const Icon(Icons.photo),
                              ),
                            ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
