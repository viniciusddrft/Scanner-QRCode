import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../base_for_form/base_for_form.dart';

class BodyFormOnlyfans extends BaseForm {
  const BodyFormOnlyfans({super.key});

  @override
  State<BodyFormOnlyfans> createState() => _BodyFormState();
}

class _BodyFormState extends State<BodyFormOnlyfans> {
  final TextEditingController _textEditingController = TextEditingController();

  late final Size _size = MediaQuery.sizeOf(context);

  String _filterToCreateQrcodeOnlyfans() =>
      _textEditingController.text.contains('https://onlyfans.com/')
          ? _textEditingController.text
          : 'https://onlyfans.com/${_textEditingController.text}';

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
              AppLocalizations.of(context)!.createQRCodeOnlyfansMsg,
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
                      .createQRCodeOnlyfansValidatorError;
                }
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText:
                    '${AppLocalizations.of(context)!.createQRCodeOnlyfansLabelDecorate} ...',
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
                filter: _filterToCreateQrcodeOnlyfans,
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
