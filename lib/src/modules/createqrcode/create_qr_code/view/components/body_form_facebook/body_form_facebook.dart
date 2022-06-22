import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../base_for_form/base_for_form.dart';

class BodyFormFacebook extends BaseForm {
  const BodyFormFacebook({super.key});

  @override
  State<BodyFormFacebook> createState() => _BodyFormFacebookState();
}

class _BodyFormFacebookState extends State<BodyFormFacebook> {
  final TextEditingController _textEditingController = TextEditingController();

  late final Size _size;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  String _filterToCreateQrcodeFacebook() =>
      _textEditingController.text.contains('https://www.facebook.com/')
          ? _textEditingController.text
          : 'https://www.facebook.com/${_textEditingController.text}';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: _size.height * 0.025),
                  child: Text(
                    AppLocalizations.of(context)!.createQRCodeFacebookMsg1,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: _size.height * 0.020),
                  child: Text(
                    AppLocalizations.of(context)!.createQRCodeFacebookMsg2,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.createQRCodeFacebookMsg3,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
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
                      .createQRCodeFacebookValidatorError;
                }
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText:
                    '${AppLocalizations.of(context)!.createQRCodeFacebookLabelDecorate} ...',
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
                filter: _filterToCreateQrcodeFacebook,
                size: _size),
          ),
        ],
      ),
    );
  }
}
