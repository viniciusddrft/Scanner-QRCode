import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../base_for_form/base_for_form.dart';

class BodyFormReddit extends BaseForm {
  const BodyFormReddit({super.key});

  @override
  State<BodyFormReddit> createState() => _BodyFormRedditState();
}

class _BodyFormRedditState extends State<BodyFormReddit> {
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

  String _filterToCreateQrcodeReddit() =>
      _textEditingController.text.contains('https://www.reddit.com/')
          ? _textEditingController.text
          : 'https://www.reddit.com/${_textEditingController.text}';

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
                  padding: EdgeInsets.only(bottom: _size.height * 0.020),
                  child: Text(
                    AppLocalizations.of(context)!.createQRCodeRedditMsg1,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.createQRCodeRedditMsg2,
                  style: Theme.of(context).textTheme.labelMedium,
                )
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
                      .createQRCodeRedditValidatorError;
                }
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText:
                    '${AppLocalizations.of(context)!.createQRCodeRedditLabelDecorate} ...',
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
                filter: _filterToCreateQrcodeReddit,
                size: _size),
          )
        ],
      ),
    );
  }
}
