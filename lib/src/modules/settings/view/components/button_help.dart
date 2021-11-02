import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/help/help_view.dart';
import 'package:scannerqrcode/src/shared/animated_page_route_builder/animated_page_rout_builder_scale.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonHelp extends StatelessWidget {
  const ButtonHelp();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
      child: Container(
        height: 45.h,
        child: OutlinedButton(
          onPressed: () => Navigator.of(context).push(
            AnimatedPageRouteBuilderScale(
                duration: Duration(milliseconds: 500),
                route: const HelpView(),
                curve: Curves.elasticOut),
          ),
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
                  'settingsFrequentProblems'.tr(),
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 7.h, bottom: 7.h),
                child: Icon(Icons.help, size: 28.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
