import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:easy_localization/easy_localization.dart';

class BodyFormLink extends BaseForm {
  @override
  _BodyFormWebsiteState createState() => _BodyFormWebsiteState();
}

class _BodyFormWebsiteState extends State<BodyFormLink> {
  final TextEditingController _textEditingController = TextEditingController();

  String _filterToCreateQrcodeLink() =>
      _textEditingController.text.contains('https://')
          ? _textEditingController.text
          : 'https://' + _textEditingController.text;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
              child: Text(
                'createQRCodeLinkMsg'.tr(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
              child: TextFormField(
                validator: (value) {
                  if (value != null && value.isNotEmpty)
                    return null;
                  else
                    return 'createQRCodeLinkValidatorError'.tr();
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'https://',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w),
              child: widget.makeButtoncreateQRCode(
                  context: context, filter: _filterToCreateQrcodeLink),
            )
          ],
        ),
      ),
    );
  }
}
