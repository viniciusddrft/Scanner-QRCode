import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

enum ShapeType { bodyShape, eyeShape }

class ButtonSwitchShape extends StatefulWidget {
  final ShapeType shapeType;

  //this class has a constructor to change the qr code's body or eye parameters
  //and though booleans it sets the texts and popup options

  const ButtonSwitchShape.eye({super.key}) : shapeType = ShapeType.eyeShape;

  const ButtonSwitchShape.body({super.key}) : shapeType = ShapeType.bodyShape;

  @override
  State<ButtonSwitchShape> createState() => _ButtonSwitchShapeState();
}

class _ButtonSwitchShapeState extends State<ButtonSwitchShape> {
  late final Size _size = MediaQuery.sizeOf(context);

  void _popupChangeShapeQR() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        key: const Key('popup change shape'),
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
          height: _size.height * 0.25,
          width: _size.width * 0.75,
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
                  SettingsQRCodeNotifier.of(context).changeShape(
                      widget.shapeType == ShapeType.eyeShape
                          ? 'shapeQRCodeEye'
                          : 'shapeQRCode',
                      index);
                  Navigator.pop(context);
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
                          ? SettingsQRCodeNotifier.of(context).colorQRCodeEye

                          //type Body
                          : SettingsQRCodeNotifier.of(context).colorQRCode,
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
          backgroundColor: Theme.of(context).colorScheme.background,
          padding: EdgeInsets.zero,
        ),
        onPressed: _popupChangeShapeQR,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: _size.height * 0.028,
                  width: _size.height * 0.028,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: widget.shapeType == ShapeType.eyeShape
                        ? BorderRadius.circular(
                            SettingsQRCodeNotifier.of(context).shapeQRCodeEye ==
                                    QrEyeShape.square
                                ? 0
                                : 360)
                        //type Body
                        : BorderRadius.circular(
                            SettingsQRCodeNotifier.of(context).shapeQRCode ==
                                    QrDataModuleShape.square
                                ? 0
                                : 360),
                    border: Border.all(
                      color: widget.shapeType == ShapeType.eyeShape
                          ? SettingsQRCodeNotifier.of(context).colorQRCodeEye
                          : SettingsQRCodeNotifier.of(context).colorQRCode,
                      width: 3,
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
