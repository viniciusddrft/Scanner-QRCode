import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scannerqrcode/src/shared/launch_link/launch_link.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonPremium extends StatelessWidget {
  const ButtonPremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
      child: SizedBox(
        height: 45.h,
        child: OutlinedButton(
          onPressed: () => launchLink(
              'https://play.google.com/store/apps/details?id=com.scannerqrcode_premium'),
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: BorderSide(color: Colors.black, width: 2.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  'settingsQRCodeDownloadPremiumVersion'.tr(),
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 7.h, bottom: 7.h),
                child: Icon(FontAwesomeIcons.crown,
                    size: 28.sp, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}