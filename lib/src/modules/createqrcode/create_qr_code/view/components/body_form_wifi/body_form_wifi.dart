import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../base_for_form/base_for_form.dart';

class BodyFormWifi extends BaseForm {
  const BodyFormWifi({super.key});

  @override
  State<BodyFormWifi> createState() => _BodyFormWifiState();
}

class _BodyFormWifiState extends State<BodyFormWifi> {
  final TextEditingController _textEditingControllerSSID =
      TextEditingController();
  final TextEditingController _textEditingControllerPASS =
      TextEditingController();

  late final Size _size = MediaQuery.of(context).size;

  String _filterToCreateQrcodeWifi() =>
      'WIFI:S:${_textEditingControllerSSID.text};T:$_typeWifiCode;P:${_textEditingControllerPASS.text};;';

  static final List<String> items = <String>['WPA/WPA2', 'WEP'];

  final ValueNotifier<String> _typeWifiCodeName =
      ValueNotifier<String>(items.first);

  String get _typeWifiCode =>
      _typeWifiCodeName.value == 'WPA/WPA2' ? 'WPA' : 'WPE';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.getKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: _size.height * 0.06,
              left: _size.width * 0.1,
              right: _size.width * 0.1,
            ),
            child: Text(
              AppLocalizations.of(context)!.createQRCodeWiFiMsg1,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: _size.height * 0.02,
              left: _size.width * 0.1,
              right: _size.width * 0.1,
            ),
            child: TextFormField(
              validator: (input) {
                if (input != null && input.isNotEmpty) {
                  return null;
                } else {
                  return AppLocalizations.of(context)!
                      .createQRCodeWiFiValidatorError1;
                }
              },
              controller: _textEditingControllerSSID,
              decoration: InputDecoration(
                labelText:
                    '${AppLocalizations.of(context)!.createQRCodeWiFiLabelDecorate1} ...',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: _size.height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppLocalizations.of(context)!.createQRCodeWiFiMsg2,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                ValueListenableBuilder(
                  valueListenable: _typeWifiCodeName,
                  builder: (BuildContext context, value, Widget? child) =>
                      DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _typeWifiCodeName.value,
                      items: items
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                      onChanged: (value) =>
                          _typeWifiCodeName.value = value as String,
                    ),
                  ),
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
              validator: (input) {
                if (input != null && input.isNotEmpty) {
                  if (input.length > 7) {
                    return null;
                  } else {
                    return AppLocalizations.of(context)!
                        .createQRCodeWiFiValidatorError2;
                  }
                } else {
                  return AppLocalizations.of(context)!
                      .createQRCodeWiFiValidatorError1;
                }
              },
              controller: _textEditingControllerPASS,
              decoration: InputDecoration(
                labelText:
                    '${AppLocalizations.of(context)!.createQRCodeWiFiLabelDecorate2} ...',
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
                filter: _filterToCreateQrcodeWifi,
                size: _size),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingControllerSSID.dispose();
    _textEditingControllerPASS.dispose();
    _typeWifiCodeName.dispose();
    super.dispose();
  }
}
