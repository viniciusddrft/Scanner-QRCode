import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../base_for_form/base_for_form.dart';

class BodyFormPrivacy extends BaseForm {
  const BodyFormPrivacy({super.key});

  @override
  State<BodyFormPrivacy> createState() => _BodyFormState();
}

class _BodyFormState extends State<BodyFormPrivacy> {
  final TextEditingController _textEditingController = TextEditingController();

  late final Size _size = MediaQuery.sizeOf(context);

  String _filterToCreateQrcodePrivacy() =>
      _textEditingController.text.contains('https://privacy.com.br/Checkout/')
          ? _textEditingController.text
          : 'https://privacy.com.br/Checkout/${_textEditingController.text}';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.getKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: _size.height * 0.020),
            child: Text(
              AppLocalizations.of(context)!.createQRCodePrivacyMsg,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: _size.height * 0.06,
              left: _size.width * 0.1,
              right: _size.width * 0.1,
            ),
            child: TextFormField(
              validator: (input) {
                if (input != null && input.isNotEmpty) {
                  return null;
                } else {
                  return AppLocalizations.of(context)!
                      .createQRCodePrivacyValidatorError;
                }
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText:
                    '${AppLocalizations.of(context)!.createQRCodePrivacyLabelDecorate} ...',
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
                context: context,
                filter: _filterToCreateQrcodePrivacy,
                size: _size),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
