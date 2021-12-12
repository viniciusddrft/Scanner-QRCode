import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BodyFormWifi extends BaseForm {
  BodyFormWifi({Key? key}) : super(key: key);

  @override
  _BodyFormWifiState createState() => _BodyFormWifiState();
}

class _BodyFormWifiState extends State<BodyFormWifi> {
  final TextEditingController _textEditingControllerSSID =
      TextEditingController();
  final TextEditingController _textEditingControllerPASS =
      TextEditingController();

  String _filterToCreateQrcodeWifi() =>
      'WIFI:S:' +
      _textEditingControllerSSID.text +
      ';T:' +
      _typeWifiCode +
      ';P:' +
      _textEditingControllerPASS.text +
      ';;';

  static final List<String> items = <String>['WPA/WPA2', 'WEP'];

  final ValueNotifier<String> _typeWifiCodeName =
      ValueNotifier<String>(items.first);

  String get _typeWifiCode =>
      _typeWifiCodeName.value == 'WPA/WPA2' ? 'WPA' : 'WPE';

  @override
  void dispose() {
    _textEditingControllerSSID.dispose();
    _textEditingControllerPASS.dispose();
    _typeWifiCodeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.getKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.h),
            child: Text(
              AppLocalizations.of(context)!.createQRCodeWiFiMsg,
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h, left: 30.w, right: 30.w),
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
                labelText: AppLocalizations.of(context)!
                        .createQRCodeWiFiLabelDecorate1 +
                    ' ...',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ValueListenableBuilder(
              valueListenable: _typeWifiCodeName,
              builder: (BuildContext context, value, Widget? child) =>
                  DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _typeWifiCodeName.value,
                  items: items
                      .map(
                        (item) => DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      _typeWifiCodeName.value = value as String,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
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
                labelText: AppLocalizations.of(context)!
                        .createQRCodeWiFiLabelDecorate2 +
                    ' ...',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.w),
            child: widget.makeButtoncreateQRCode(
                context: context, filter: _filterToCreateQrcodeWifi),
          )
        ],
      ),
    );
  }
}
