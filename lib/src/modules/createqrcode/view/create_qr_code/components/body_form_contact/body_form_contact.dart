import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BodyFormContact extends BaseForm {
  const BodyFormContact({Key? key}) : super(key: key);

  @override
  _BodyFormContactState createState() => _BodyFormContactState();
}

class _BodyFormContactState extends State<BodyFormContact> {
  final TextEditingController _textEditingControllerName =
      TextEditingController();
  final TextEditingController _textEditingControllerNumber =
      TextEditingController();

  @override
  void dispose() {
    _textEditingControllerName.dispose();
    _textEditingControllerNumber.dispose();
    super.dispose();
  }

  String _filterToCreateQrcodeContact() =>
      'MECARD:N:' +
      _textEditingControllerName.text +
      ';TEL:' +
      _textEditingControllerNumber.text +
      ';;';

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Form(
      key: widget.getKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: _size.height * 0.06,
              left: _size.width * 0.1,
              right: _size.width * 0.1,
            ),
            child: TextFormField(
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return AppLocalizations.of(context)!
                      .createQRCodeContactNameValidatorError;
                }
              },
              controller: _textEditingControllerName,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!
                        .createQRCodeContactNameLabelDecorate +
                    ' ...',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: _size.height * 0.06,
              left: _size.width * 0.1,
              right: _size.width * 0.1,
            ),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return AppLocalizations.of(context)!
                      .createQRCodeContactPhoneValidatorError;
                }
              },
              controller: _textEditingControllerNumber,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!
                        .createQRCodeContactPhoneLabelDecorate +
                    ' ...',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _size.width * 0.22),
            child: widget.makeButtoncreateQRCode(
                context: context, filter: _filterToCreateQrcodeContact),
          )
        ],
      ),
    );
  }
}
