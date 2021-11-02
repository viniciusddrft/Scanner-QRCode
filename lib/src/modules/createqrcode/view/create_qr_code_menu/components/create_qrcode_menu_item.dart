import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/create_qrcode_view.dart';
import 'package:scannerqrcode/src/shared/animated_page_route_builder/animated_page_rout_builder_scale.dart';

class CreateQRCodeItemMenu extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String text;
  final String typeQRCode;
  CreateQRCodeItemMenu(
      {required this.icon,
      required this.text,
      required this.typeQRCode,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(80.sp, 80.sp),
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(360),
            ),
          ),
          onPressed: () => Navigator.push(
            context,
            AnimatedPageRouteBuilderScale(
              duration: Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              route: CreateQRCodeView(
                typeQRCode: typeQRCode,
              ),
            ),
          ),
          child: Center(
            child: icon,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Text(text, style: TextStyle(fontSize: 14.sp)),
        )
      ],
    );
  }
}
