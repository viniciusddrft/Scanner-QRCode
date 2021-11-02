import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class BodyFormWhatsapp extends BaseForm {
  @override
  _BodyFormWhatsappState createState() => _BodyFormWhatsappState();
}

class _BodyFormWhatsappState extends State<BodyFormWhatsapp> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _filterToCreateQrcodeWhatsapp() =>
      'https://api.whatsapp.com/send?phone=' + _textEditingController.text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: widget.getKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value != null && value.isNotEmpty)
                    return null;
                  else
                    return 'createQRCodeWhatsappValidatorError'.tr();
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'createQRCodeWhatsappLabelDecorate'.tr() + ' ...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w),
              child: widget.makeButtoncreateQRCode(
                  context: context, filter: _filterToCreateQrcodeWhatsapp),
            ),
          ],
        ),
      ),
    );
  }
}
