import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class BaseForm extends StatefulWidget {
  final _formkey = GlobalKey<FormState>();

  BaseForm({Key? key}) : super(key: key);

  GlobalKey<FormState> get getKey => _formkey;

  void _onPressed(
      {required BuildContext context, required String Function() filter}) {
    final _isValid = _formkey.currentState!.validate();
    if (_isValid) {
      Navigator.pushReplacementNamed(context, '/CreateQRCodeResult',
          arguments: <String, String>{
            'dataQRCode': filter(),
          });
    }
  }

  Widget makeButtoncreateQRCode(
          {required BuildContext context, required String Function() filter}) =>
      SizedBox(
        height: 40.h,
        width: 250.w,
        child: ElevatedButton(
          onPressed: () => _onPressed(context: context, filter: filter),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                AppLocalizations.of(context)!.createQRCodeALLButton,
                style: TextStyle(fontSize: 14.sp),
              ),
              Icon(
                Icons.qr_code_2,
                size: 24.sp,
              )
            ],
          ),
        ),
      );
}
