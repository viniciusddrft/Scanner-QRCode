import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class BodyFormYoutube extends BaseForm {
  @override
  _BodyFormYoutubeState createState() => _BodyFormYoutubeState();
}

class _BodyFormYoutubeState extends State<BodyFormYoutube> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _filterToCreateQrcodeYoutube() =>
      _textEditingController.text.contains('https://www.youtube.com/') ||
              _textEditingController.text.contains('https://youtu.be/') ||
              _textEditingController.text.contains('https://youtube.com/')
          ? _textEditingController.text
          : 'https://youtu.be/' + _textEditingController.text;

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
                      'createQRCodeYoutubeMsg1'.tr(),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.sp),
                    child: Text(
                      'createQRCodeYoutubeMsg2'.tr(),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  Text(
                    'createQRCodeYoutubeMsg3'.tr(),
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
                    return 'createQRCodeYoutubeValidatorError'.tr();
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'createQRCodeYoutubeLabelDecorate'.tr() + ' ...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w),
              child: widget.makeButtoncreateQRCode(
                  context: context, filter: _filterToCreateQrcodeYoutube),
            ),
          ],
        ),
      ),
    );
  }
}
