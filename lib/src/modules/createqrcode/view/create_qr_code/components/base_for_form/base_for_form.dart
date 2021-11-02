import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code_result/create_qrcode_result_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scannerqrcode/src/shared/animated_page_route_builder/animated_page_rout_builder_scale.dart';

abstract class BaseForm extends StatefulWidget {
  final _formkey = GlobalKey<FormState>();

  GlobalKey<FormState> get getKey => _formkey;

  void _onPressed(
      {required BuildContext context, required String Function() filter}) {
    final _isValid = _formkey.currentState!.validate();
    if (_isValid)
      Navigator.pushReplacement(
        context,
        AnimatedPageRouteBuilderScale(
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: 500),
          route: CreateQRCodeResult(
            dataQRCode: filter(),
          ),
        ),
      );
  }

  Widget makeButtoncreateQRCode(
          {required BuildContext context, required String Function() filter}) =>
      Container(
        height: 40.h,
        width: 250.w,
        child: ElevatedButton(
          onPressed: () => _onPressed(context: context, filter: filter),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'createQRCodeALLButton'.tr(),
                  style: TextStyle(fontSize: 14.sp),
                ),
                Icon(
                  Icons.qr_code_2,
                  size: 24.sp,
                )
              ],
            ),
          ),
        ),
      );
}
