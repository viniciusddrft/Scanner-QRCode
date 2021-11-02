import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class BodyFormFacebook extends BaseForm {
  @override
  _BodyFormFacebookState createState() => _BodyFormFacebookState();
}

class _BodyFormFacebookState extends State<BodyFormFacebook> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _filterToCreateQrcodeFacebook() =>
      _textEditingController.text.contains('https://www.facebook.com/')
          ? _textEditingController.text
          : 'https://www.facebook.com/' + _textEditingController.text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: widget.getKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.sp),
                    child: Text(
                      'createQRCodeFacebookMsg1'.tr(),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.sp),
                    child: Text(
                      'createQRCodeFacebookMsg2'.tr(),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  Text(
                    'createQRCodeFacebookMsg3'.tr(),
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
              child: TextFormField(
                validator: (value) {
                  if (value != null && value.isNotEmpty)
                    return null;
                  else
                    return 'createQRCodeFacebookValidatorError'.tr();
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'createQRCodeFacebookLabelDecorate'.tr() + ' ...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w),
              child: widget.makeButtoncreateQRCode(
                  context: context, filter: _filterToCreateQrcodeFacebook),
            ),
          ],
        ),
      ),
    );
  }
}
