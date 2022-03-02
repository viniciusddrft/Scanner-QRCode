import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BodyFormYoutube extends BaseForm {
  const BodyFormYoutube({Key? key}) : super(key: key);

  @override
  _BodyFormYoutubeState createState() => _BodyFormYoutubeState();
}

class _BodyFormYoutubeState extends State<BodyFormYoutube> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _filterToCreateQrcodeYoutube() =>
      _textEditingController.text.contains('https://www.youtube.com/') ||
              _textEditingController.text.contains('https://youtu.be/') ||
              _textEditingController.text.contains('https://youtube.com/')
          ? _textEditingController.text
          : 'https://youtu.be/' + _textEditingController.text;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: _size.height * 0.020),
                  child: Text(
                    AppLocalizations.of(context)!.createQRCodeYoutubeMsg1,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: _size.height * 0.025),
                  child: Text(
                    AppLocalizations.of(context)!.createQRCodeYoutubeMsg2,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.createQRCodeYoutubeMsg3,
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
                      .createQRCodeYoutubeValidatorError;
                }
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!
                        .createQRCodeYoutubeLabelDecorate +
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
                context: context, filter: _filterToCreateQrcodeYoutube),
          ),
        ],
      ),
    );
  }
}
