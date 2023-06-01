import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../base_for_form/base_for_form.dart';

class BodyFormWhatsapp extends BaseForm {
  const BodyFormWhatsapp({super.key});

  @override
  State<BodyFormWhatsapp> createState() => _BodyFormWhatsappState();
}

class _BodyFormWhatsappState extends State<BodyFormWhatsapp> {
  final TextEditingController _textEditingController = TextEditingController();
  late final Size _size = MediaQuery.sizeOf(context);

  String _filterToCreateQrcodeWhatsapp() =>
      'https://api.whatsapp.com/send?phone=${_textEditingController.text}';

  @override
  Widget build(BuildContext context) {
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
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return AppLocalizations.of(context)!
                      .createQRCodeWhatsappValidatorError;
                }
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText:
                    '${AppLocalizations.of(context)!.createQRCodeWhatsappLabelDecorate} ...',
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
                filter: _filterToCreateQrcodeWhatsapp,
                size: _size),
          ),
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
