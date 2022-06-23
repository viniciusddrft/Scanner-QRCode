import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/settings_create_qrcode.dart';

enum ShapeType { bodyShape, eyeShape }

class ButtonSwitchShape extends StatefulWidget {
  final ShapeType shapeType;
  final ValueNotifier<Color> color;

  //this class has a constructor to change the qr code's body or eye parameters
  //and though booleans it sets the texts and popup options

  const ButtonSwitchShape.eye({required this.color, super.key})
      : shapeType = ShapeType.eyeShape;

  const ButtonSwitchShape.body({required this.color, super.key})
      : shapeType = ShapeType.bodyShape;

  @override
  State<ButtonSwitchShape> createState() => _ButtonSwitchShapeState();
}

class _ButtonSwitchShapeState extends State<ButtonSwitchShape> {
  final SettingsCreateQRCode settingsCreateQRCode = SettingsCreateQRCode();
  late final Size _size;

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  void _popupChangeShapeQR() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: widget.shapeType == ShapeType.eyeShape
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
              itemCount: widget.shapeType == ShapeType.eyeShape
                  ? QrEyeShape.values.length
                  : QrDataModuleShape.values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  if (widget.shapeType == ShapeType.eyeShape) {
                    settingsCreateQRCode.shapeQRCodeEye.value =
                        QrEyeShape.values[index];

                    SharedPreferences.getInstance().then((preference) =>
                        preference.setInt('shapeQRCodeEye', index));

                    Navigator.pop(context);
                  } else {
                    settingsCreateQRCode.shapeQRCode.value =
                        QrDataModuleShape.values[index];

                    SharedPreferences.getInstance().then((preference) =>
                        preference.setInt('shapeQRCode', index));

                    Navigator.pop(context);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: widget.shapeType == ShapeType.eyeShape
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
                      color: widget.shapeType == ShapeType.eyeShape
                          ? settingsCreateQRCode.colorQRCodeEye.value
                          //type Body
                          : settingsCreateQRCode.colorQRCode.value,
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
  Widget build(BuildContext context) {
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
                  animation: Listenable.merge([
                    widget.color,
                    widget.shapeType == ShapeType.bodyShape
                        ? settingsCreateQRCode.shapeQRCode
                        : settingsCreateQRCode.shapeQRCodeEye
                  ]),
                  builder: (BuildContext context, Widget? child) => Container(
                    height: _size.height * 0.028,
                    width: _size.height * 0.028,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: widget.shapeType == ShapeType.eyeShape
                          ? BorderRadius.circular(
                              settingsCreateQRCode.shapeQRCodeEye.value ==
                                      QrEyeShape.square
                                  ? 0
                                  : 360)
                          //type Body
                          : BorderRadius.circular(
                              settingsCreateQRCode.shapeQRCode.value ==
                                      QrDataModuleShape.square
                                  ? 0
                                  : 360),
                      border: Border.all(
                        color: widget.color.value,
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
                  widget.shapeType == ShapeType.eyeShape
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
