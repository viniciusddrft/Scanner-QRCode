import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:easy_localization/easy_localization.dart';

class BodyFormTwitch extends BaseForm {
  BodyFormTwitch({Key? key}) : super(key: key);

  @override
  _BodyFormTwitchState createState() => _BodyFormTwitchState();
}

class _BodyFormTwitchState extends State<BodyFormTwitch> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _filterToCreateQrcodeTwitch() =>
      _textEditingController.text.contains('https://www.twitch.tv/')
          ? _textEditingController.text
          : 'https://www.twitch.tv/' + _textEditingController.text;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.getKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.h),
            child: Text(
              'createQRCodeTwitchMsg'.tr(),
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
            child: TextFormField(
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'createQRCodeTwitchValidatorError'.tr();
                }
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'createQRCodeTwitchLabelDecorate'.tr() + ' ...',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.w),
            child: widget.makeButtoncreateQRCode(
                context: context, filter: _filterToCreateQrcodeTwitch),
          )
        ],
      ),
    );
  }
}
