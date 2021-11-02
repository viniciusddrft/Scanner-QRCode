import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:easy_localization/easy_localization.dart';

class BodyFormReddit extends BaseForm {
  @override
  _BodyFormRedditState createState() => _BodyFormRedditState();
}

class _BodyFormRedditState extends State<BodyFormReddit> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _filterToCreateQrcodeReddit() =>
      _textEditingController.text.contains('https://www.reddit.com/')
          ? _textEditingController.text
          : 'https://www.reddit.com/' + _textEditingController.text;

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
                    padding: EdgeInsets.only(bottom: 10.sp),
                    child: Text(
                      'createQRCodeRedditMsg1'.tr(),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  Text('createQRCodeRedditMsg2'.tr(),
                      style: TextStyle(fontSize: 14.sp))
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
                    return 'createQRCodeRedditValidatorError'.tr();
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'createQRCodeRedditLabelDecorate'.tr() + ' ...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w),
              child: widget.makeButtoncreateQRCode(
                  context: context, filter: _filterToCreateQrcodeReddit),
            )
          ],
        ),
      ),
    );
  }
}
