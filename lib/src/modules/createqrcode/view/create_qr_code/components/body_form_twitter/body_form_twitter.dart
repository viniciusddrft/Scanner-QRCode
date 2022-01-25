import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BodyFormTwitter extends BaseForm {
  const BodyFormTwitter({Key? key}) : super(key: key);

  @override
  _BodyFormTwitterState createState() => _BodyFormTwitterState();
}

class _BodyFormTwitterState extends State<BodyFormTwitter> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _filterToCreateQrcodeTwitter() =>
      _textEditingController.text.contains('https://twitter.com/')
          ? _textEditingController.text
          : 'https://twitter.com/' + _textEditingController.text;

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
              AppLocalizations.of(context)!.createQRCodeTwitterMsg,
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50.h, left: 30.w, right: 30.w),
            child: TextFormField(
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return AppLocalizations.of(context)!
                      .createQRCodeTwitterValidatorError;
                }
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!
                    .createQRCodeTwitterLabelDecorate,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.w),
            child: widget.makeButtoncreateQRCode(
                context: context, filter: _filterToCreateQrcodeTwitter),
          ),
        ],
      ),
    );
  }
}
