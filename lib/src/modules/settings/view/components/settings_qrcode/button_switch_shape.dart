import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../controller/settings_create_qrcode.dart';

class ButtonSwitchShape extends StatefulWidget {
  final ValueNotifier<QrDataModuleShape>? bodyShape;
  final ValueNotifier<Color>? colorBodyShape;
  final bool isBody;
  final ValueNotifier<QrEyeShape>? eyeShape;
  final ValueNotifier<Color>? colorEyeShape;
  final bool isEye;

  //this class has a constructor to change the qr code's body or eye parameters
  //and though booleans it sets the texts and popup options

  const ButtonSwitchShape.eye(
      {required this.eyeShape, required this.colorEyeShape, Key? key})
      : isEye = true,
        bodyShape = null,
        colorBodyShape = null,
        isBody = false,
        super(key: key);

  const ButtonSwitchShape.body(
      {required this.bodyShape, required this.colorBodyShape, Key? key})
      : isBody = true,
        eyeShape = null,
        colorEyeShape = null,
        isEye = false,
        super(key: key);

  @override
  _ButtonSwitchShapeState createState() => _ButtonSwitchShapeState();
}

class _ButtonSwitchShapeState extends State<ButtonSwitchShape> {
  late ValueNotifier<Color> _color;
  late ValueNotifier<dynamic> _shape;

  void _popupChangeShapeQR() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: widget.isEye && !widget.isBody
            ? Text(
                AppLocalizations.of(context)!.settingsPopupColorEyeTitle,
                style: Theme.of(context).textTheme.labelLarge,
              )
            : Text(
                AppLocalizations.of(context)!.settingsPopupColorShapeTitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: GridView.builder(
              itemCount: widget.isEye && !widget.isBody
                  ? QrEyeShape.values.length
                  : QrDataModuleShape.values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  if (widget.isEye && !widget.isBody) {
                    SettingsCreateQRCode.shapeQRCodeEye.value =
                        QrEyeShape.values[index];

                    SharedPreferences.getInstance().then((preference) =>
                        preference.setInt('shapeQRCodeEye', index));

                    Navigator.pop(context);
                  } else {
                    SettingsCreateQRCode.shapeQRCode.value =
                        QrDataModuleShape.values[index];

                    SharedPreferences.getInstance().then((preference) =>
                        preference.setInt('shapeQRCode', index));

                    Navigator.pop(context);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: widget.isEye && !widget.isBody
                        ? BorderRadius.circular(
                            QrEyeShape.values[index] == QrEyeShape.square
                                ? 0
                                : 360)
                        //type Body
                        : BorderRadius.circular(
                            QrDataModuleShape.values[index] ==
                                    QrDataModuleShape.square
                                ? 0
                                : 360),
                    border: Border.all(
                      color: widget.isEye && !widget.isBody
                          ? SettingsCreateQRCode.colorQRCodeEye.value
                          //type Body
                          : SettingsCreateQRCode.colorQRCode.value,
                      width: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              AppLocalizations.of(context)!.settingsPopupButtonCancel,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    if (widget.isBody && !widget.isEye) {
      _color = widget.colorBodyShape!;
      _shape = widget.bodyShape!;
    } else if (widget.isEye && !widget.isBody) {
      _color = widget.colorEyeShape!;
      _shape = widget.eyeShape!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SizedBox(
      height: _size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          primary: Theme.of(context).backgroundColor,
        ),
        onPressed: _popupChangeShapeQR,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: AnimatedBuilder(
                  animation: Listenable.merge([_color, _shape]),
                  builder: (BuildContext context, Widget? child) => Container(
                    height: _size.height * 0.028,
                    width: _size.height * 0.028,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: widget.isEye && !widget.isBody
                          ? BorderRadius.circular(
                              SettingsCreateQRCode.shapeQRCodeEye.value ==
                                      QrEyeShape.square
                                  ? 0
                                  : 360)
                          //type Body
                          : BorderRadius.circular(
                              SettingsCreateQRCode.shapeQRCode.value ==
                                      QrDataModuleShape.square
                                  ? 0
                                  : 360),
                      border: Border.all(
                        color: _color.value,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 6,
                child: Text(
                  widget.isEye && !widget.isBody
                      ? AppLocalizations.of(context)!.settingsButtonShapeEyeQR
                      : AppLocalizations.of(context)!.settingsButtonShapeQR,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
