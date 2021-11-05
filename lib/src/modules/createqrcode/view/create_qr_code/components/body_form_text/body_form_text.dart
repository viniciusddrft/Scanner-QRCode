import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:easy_localization/easy_localization.dart';

class BodyFormText extends BaseForm {
  BodyFormText({Key? key}) : super(key: key);

  @override
  _BodyFormState createState() => _BodyFormState();
}

class _BodyFormState extends State<BodyFormText> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _filterToCreateQrcodeText() => _textEditingController.text;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.getKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
            child: TextFormField(
              validator: (input) {
                if (input != null && input.isNotEmpty) {
                  return null;
                } else {
                  return 'createQRCodeTextValidatorError'.tr();
                }
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'createQRCodeTextLabelDecorate'.tr() + ' ...',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.w),
            child: widget.makeButtoncreateQRCode(
                context: context, filter: _filterToCreateQrcodeText),
          )
        ],
      ),
    );
  }
}
